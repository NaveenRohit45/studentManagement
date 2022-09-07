from database import Database


class Menu:
    def __init__(self, user_action, student_name, student_age, student_phone, delete_name, search_name):
        self.user_action = user_action
        self.student_name = student_name
        self.student_age = student_age
        self.student_phone = student_phone
        self.delete_name = delete_name
        self.search_name = search_name

    def header(self):
        print('*****************')
        print('Madras University')
        print('*****************')

    def homepage(self):
        print('\n1.Add Student Name\n2.Delete Student Name\n3.Search Student Details\n4.Show All Details\n5.Update '
              'Student Details\n0.exit')

    def read_user_action(self):
        self.user_action = int(input('Enter your action:'))

    def process(self):
        self.user_action = int(input('Enter your action:'))
        if self.user_action == 1:
            self.header()
            self.add_user()

        elif self.user_action == 2:
            self.header()
            self.delete_student_name()

        elif self.user_action == 3:
            self.header()
            self.search_student_name()

        elif self.user_action == 4:
            self.header()
            obj.show_database()

        elif self.user_action == 5:
            self.header()
            self.updateStudentDetails()

        elif self.user_action == 0:
            print('THANK YOU..........!')
            exit()

        else:
            print('Hey Naveen')

    def add_user(self):
        self.student_name = input('Enter Student Name: ')
        self.student_age = input('Enter Age of the Student: ')
        self.student_phone = input('Enter Student Phone No: ')
        obj.insert_into_database(student_name, student_age, student_phone)

    def delete_student_name(self):
        self.delete_name = input('Enter the Name to delete Student Details: ')
        obj.delete_from_database(self.delete_name)

    def search_student_name(self):
        self.search_name = input('ENTER THE STUDENT NAME: ')
        obj.search_from_database(self.search_name)


obj = Database()
