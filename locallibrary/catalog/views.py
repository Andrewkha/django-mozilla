from django.shortcuts import render
from .models import Author, Book, BookInstance, Genre
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

    context = {
        'num_books': num_books,
        'num_instances': num_instances,
        'num_instances_available': num_instances_available,
        'num_authors': num_authors,
        'spec_genre': spec_genre,
        'spec_books': spec_books,
    }

    return render(request, 'index.html', context=context)
