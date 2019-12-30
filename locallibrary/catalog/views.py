import datetime

from django.shortcuts import render, get_object_or_404
from django.contrib.auth.decorators import permission_required
from django.http import HttpResponseRedirect
from django.urls import reverse
from django.views import generic
from .models import Author, Book, BookInstance, Genre
from .test import ldap
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.auth.mixins import PermissionRequiredMixin
from django.views.generic.edit import CreateView, UpdateView, DeleteView
from django.urls import reverse_lazy

from .forms import RenewBookForm, RenewBookModelForm
# Create your views here.


def index(request):
    num_books = Book.objects.all().count()
    num_instances = BookInstance.objects.all().count()
    num_instances_available = BookInstance.objects.filter(status__exact='a').count()

    # The 'all()' is implied by default.
    num_authors = Author.objects.count()

    # genres and books with specific words
    spec_genre = Genre.objects.filter(name__icontains='fiction').count()
    spec_books = Book.objects.filter(title__icontains='голова').count()

    num_visits = request.session.get('num_visits', 0)
    request.session['num_visits'] = num_visits + 1

    connection = ldap

    context = {
        'num_books': num_books,
        'num_instances': num_instances,
        'num_instances_available': num_instances_available,
        'num_authors': num_authors,
        'spec_genre': spec_genre,
        'spec_books': spec_books,
        'num_visits': num_visits,
        'connection': connection
    }

    return render(request, 'index.html', context=context)


class BookListView(generic.ListView):
    model = Book
    paginate_by = 2
    template_name = 'catalog/book/book_list.html'


class BookDetailView(generic.DetailView):
    model = Book
    template_name = 'catalog/book/book_detail.html'


class AuthorListView(generic.ListView):
    model = Author
    paginate_by = 2
    template_name = 'catalog/author/author_list.html'


class AuthorDetailView(generic.DetailView):
    model = Author
    template_name = 'catalog/author/author_detail.html'


class LoanedBooksByUserListView(LoginRequiredMixin, generic.ListView):
    model = BookInstance
    template_name = 'catalog/bookinstance_list_borrowed_user.html'
    paginate_by = 10

    def get_queryset(self):
        return BookInstance.objects.filter(borrower=self.request.user).filter(status__exact='o').order_by('due_back')


class AllLoanedBooksListView(PermissionRequiredMixin, generic.ListView):
    model = BookInstance
    permission_required = 'catalog.can_mark_returned'
    template_name = 'catalog/bookinstance_list_borrowed_all.html'
    paginate_by = 10

    def get_queryset(self):
        return BookInstance.objects.filter(status__exact='o').order_by('due_back')


@permission_required('catalog.can_mark_returned')
def renew_book_librarian(request, pk):
    book_instance = get_object_or_404(BookInstance, pk=pk)

    if request.method == 'POST':
        form = RenewBookModelForm(request.POST)

        if form.is_valid():
            book_instance.due_back = form.cleaned_data['due_back']
            book_instance.save()

            return HttpResponseRedirect(reverse('all-borrowed'))
    else:
        proposed_renewal_date = datetime.date.today() + datetime.timedelta(weeks=3)
        form = RenewBookModelForm(initial={'due_back': proposed_renewal_date})

    context = {
        'form': form,
        'book_instance': book_instance
    }

    return render(request, 'catalog/book_renew_librarian.html', context)


class AuthorCreate(PermissionRequiredMixin, CreateView):
    model = Author
    permission_required = 'catalog.can_mark_returned'
    fields = '__all__'
    initial = {'date_of_death': '05/01/2018'}
    success_url = reverse_lazy('authors')


class AuthorUpdate(PermissionRequiredMixin, UpdateView):
    model = Author
    permission_required = 'catalog.can_mark_returned'
    fields = ['first_name', 'last_name', 'date_of_birth', 'date_of_death']
    success_url = reverse_lazy('authors')


class AuthorDelete(PermissionRequiredMixin, DeleteView):
    model = Author
    permission_required = 'catalog.can_mark_returned'
    success_url = reverse_lazy('authors')


class BookCreate(PermissionRequiredMixin, CreateView):
    model = Book
    permission_required = 'catalog.can_mark_returned'
    template_name = 'catalog/book/book_form.html'
    fields = '__all__'
    success_url = reverse_lazy('books')


class BookUpdate(PermissionRequiredMixin, UpdateView):
    model = Book
    permission_required = 'catalog.can_mark_returned'
    template_name = 'catalog/book/book_form.html'
    fields = '__all__'
    success_url = reverse_lazy('books')


class BookDelete(PermissionRequiredMixin, DeleteView):
    model = Book
    permission_required = 'catalog.can_mark_returned'
    template_name = 'catalog/book/book_confirm_delete.html'
    success_url = reverse_lazy('book')