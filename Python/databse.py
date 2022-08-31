def header():
    print('*****************')
    print('Madras University')
    print('*****************')


header()


def homepage():
    print('1.Add Student Name')
    print('2.Delete Student Name')
    print('3.Search Student Name')
    print('0.exit')


homepage()


def readUserInput(user_action):
    # = input('Enter your action:')
    print(user_action)
    return user_action


readUserInput(input("Enter your acrion:"))


def add_user(readUserInput(user_action)):
    if (user_action == 1):
        print('Thank you!')

    else:
        print('Hi Naveen')


add_user()
