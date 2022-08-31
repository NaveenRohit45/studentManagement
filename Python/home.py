import time
import main
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
        main.add_user()

    elif user_action == 2:
        main.delete_student_name()

    elif user_action == 3:
        main.searchStudentName()

    elif user_action == 0:
        print('THANK YOU..........!')
        exit()

    else:
        print('Hey Hari')


if __name__ == '__main__':
    homepage()
    header()
    process()
