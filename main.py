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

def get_random_health_tip():
    query = "SELECT * FROM tips ORDER BY RAND() LIMIT 1"
    result = execute_query(query, fetch=True)

    if result:
        tip = HealthTip(result[0])
        tip.print()
    else:
        print("No health tips available at the moment.\n")

   def get_user_input(prompt):
    return input(prompt).strip()

def explore_next_action(category):
    print("\nNEXT ACTIONS")
    print("0. Go to Homepage")
    print("1. Type in a text to search again")
    print("Press Enter to generate a random", category)
    choice = get_user_input("\nChoose an action: ")

    clear_screen()

    if choice == "0":
        display_menu()
    else:
        column = "category" if category == "flashcard" else ("topic" if category == "tip" else "name")
        search_and_filter(category, choice, not bool(choice), column)

def search_and_filter(category, term="", by_random=False, column="name"):
    if not term and not by_random:
        term = get_user_input(f"Enter the {category} you want to search for: ")

    query = f"SELECT * FROM {category}s ORDER BY RAND() LIMIT 1" if by_random else f"SELECT * FROM {category}s WHERE {column} LIKE %s"
    results = execute_query(query, (f'%{term}%',), fetch=True) if not by_random else execute_query(query, fetch=True)
    if results:
        for result in results:
            # Create object based on category and call print function
            if category == "disease":
                disease = Disease(result)
                disease.print()
            elif category == "symptom":
                symptom = Symptom(result)
                symptom.print()
            elif category == "drug":
                drug = Drug(result)
                drug.print()
            elif category == "flashcard":
                flashcard = FlashCard(result)
                flashcard.print()
            elif category == "tip":
                tip = HealthTip(result)
                tip.print()
    else:
        print(f"No {category}s found.")

    explore_next_action(category)

            
