import time
import database
import os


def header():
    print('*****************')
    print('Madras University')
    print('*****************')


def homepage():
    print('1.Add Student Name')
    print('2.Delete Student Name')
    print('3.Search Student Name')
    print('0.exit')


def read_user_action():
    user_action = int(input('Enter your action:'))
    return user_action


def process():
    user_action = read_user_action()
    if user_action == 1:
        add_user()

    elif user_action == 2:
        database.delete_student_name()

    elif user_action == 3:
        database.searchStudentName()

    elif user_action == 4:
        database.showDatabase()

    elif user_action == 5:
        database.updateStudentDetails()

    elif user_action == 0:
        print('THANK YOU..........!')
        exit()

    else:
        print('Hey Naveen')


def add_user():
    print(student_name=input('Enter Student Name: '))
    print(student_age=input('Enter Age of the Student: '))
    print(student_phone=input('Enter Student Phone No: '))
    database.insert_into_database(student_)


if __name__ == '__main__':
    homepage()
    header()
    process()
