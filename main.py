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

def get_random_health_tip(self):
        query = "SELECT * FROM well_being_tips ORDER BY RAND() LIMIT 1"
        self.execute_query(query)
        result = self.cursor.fetchone()

        if result:
            return f"\nHealth Tip: {result[1]}\n{result[2]}\n"
        else:
            return "\nNo health tips available at the moment.\n"

    def get_disease_info(self):
        disease_name = input("Enter the name of the disease: ")
        query = "SELECT * FROM diseases WHERE name = %s"
        result = self.execute_query(query, (disease_name,), fetch=True)

        if result:
            print(result)
        else:
            print("Disease not found.")

    # Define other methods within the class following a similar structure

    def close_connection(self):
        # Close the cursor and connection
        self.cursor.close()
        self.connection.close()
   
if __name__ == "__main__":
    hub = healthcare_hub()

    while True:
        print(hub.get_welcome_message())
        hub.display_menu()

        choice = input("Enter your choice (1-8): ")
        print("\n")

            
