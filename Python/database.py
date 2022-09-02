import sqlite3


def connect_database():
    conn = sqlite3.connect('DATABASE.db')
    print("OPENED DATABASE SUCCESSFULLY\n")
    return conn


def creating_table():
    conn = connect_database()
    conn.execute('''CREATE TABLE IF NOT EXISTS STUDENT_DATABASE
             (NAME  TEXT    NOT NULL,
             AGE    INT     NOT NULL,
             PHONE  INT     NOT NULL);''')
    print("Table Created Successfully...\n")
    return conn


def insert_into_database(student_name, student_age, student_phone):
    conn = connect_database()
    print(student_name, student_age, student_phone)
    conn.execute("INSERT INTO STUDENT_DATABASE (NAME,AGE,PHONE) \
        VALUES (?,?,?)", (student_name, student_age, student_phone))

    conn.commit()
    print("INSERT THE STUDENT DETAILS SUCCESSFULLY")


def delete_from_database(delete_name):
    conn = creating_table()
    conn.execute("DELETE FROM STUDENT_DATABASE WHERE NAME = ?", (delete_name,))
    print("Student name has been deleted")
    conn.commit()


def show_database():
    conn = connect_database()
    conn.execute("SELECT * FROM STUDENT_DATABASE")
    output = conn.execute("SELECT * FROM STUDENT_DATABASE")
    for row in output:
        print(row)
    conn.commit()


def search_from_database(search_name):
    conn = connect_database()
    conn.execute("SELECT * FROM STUDENT_DATABASE WHERE NAME = ?", (search_name,))
    output = conn.execute("SELECT * FROM STUDENT_DATABASE WHERE NAME = ?", (search_name,))
    print(output.fetchall())
    conn.commit()
