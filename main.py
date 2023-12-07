import mysql.connector
import os

class healthcare_hub:
    def __init__(self):
        # Connect to MySQL
        self.connection = mysql.connector.connect(
            host="localhost",
            user="root",
            password="",
            database="healthcare_hub"
        )
        # Create a cursor object
        self.cursor = self.connection.cursor()

def execute_query(self, query, data=None, fetch=False):
        self.cursor.execute(query, data)
        if fetch:
            return self.cursor.fetchall()
        else:
            self.connection.commit()

    def get_welcome_message(self):
        return "Welcome to Healthcare Hub! Stay healthy and informed.\n"

    def display_menu(self):
        print("\nHealthcare Hub Console Application\n")
        print("1. Disease Information")
        print("2. Symptom Exploration")
        print("3. Drug Exploration")
        print("4. Educational Flashcards")
        print("5. Random Health Tip")
        print("6. Posts Exploration")
        print("7. Share Post")
        print("8. Exit\n")
