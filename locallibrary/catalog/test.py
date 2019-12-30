class A:
    connection = 'disconnected'

    def connect(self):
        return self.connection

ldap = A()