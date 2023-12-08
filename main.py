import mysql.connector
import os
from classes import HealthTip, Drug, Symptom, FlashCard, Disease, Post

# Connect to MySQL
connection = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    database="healthcare_hub"
)

# Create a cursor object
cursor = connection.cursor()

# Function to execute MySQL queries
def execute_query(query, data=None, fetch=False):
    cursor.execute(query, data)
    if fetch:
        return cursor.fetchall()
    else:
        connection.commit()

# Function to get personalized health tip or quote
def get_welcome_message():
    return "Welcome to Healthcare Hub! Stay healthy and informed.\n"

# Function to display the main menu
def display_menu():
    print("\nHealthcare Hub Console Application\n")
    print("1. Disease Information")
    print("2. Symptom Exploration")
    print("3. Drug Exploration")
    print("4. Educational Flashcards")
    print("5. Random Health Tip")
    print("6. Posts Expoloration")
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

def clear_screen():
    os.system('cls' if os.name == 'nt' else 'clear')

# Function to share health information
def share_post():
    clear_screen()
    print("\nShare Health Information\n\n")
    category = get_user_input("Enter the category: ")
    title = get_user_input("Enter the title: ")
    description = get_user_input("Enter the description: ")
    posted_by = get_user_input("Enter your name: ")

    # Check if any input is empty
    if not all([category, title, description, posted_by]):
        print("\nError: All fields must be filled. Please try again.\n")
    else:

    # Insert data into the shared_health_info table
        query = "INSERT INTO posts (category, title, description, posted_by) VALUES (%s, %s, %s, %s)"
        data = (category, title, description, posted_by)
        execute_query(query, data)

        print("\n\nHealth information shared successfully!")

    print("\n\nNEXT ACTION")
    print("1. Share another post")
    print("Or any key to go to homepage")
    choice = get_user_input(f"Enter your choice ")

    clear_screen()

    if (choice=="1"):
        share_post()
    else:
        display_menu()


def single_post(id=""):
    clear_screen()
    query =  f"SELECT * FROM posts ORDER BY RAND() LIMIT 1" if id=="" else f"SELECT * FROM posts WHERE id = %s"
    results = execute_query(query, (f"{id}",), fetch=True) if id!="" else execute_query(query, fetch=True)
    if results:
        for result in results:
            post = Post(result)
            post.print()
    else:
        print(f"No post found.")
    posts_next_actions()


def posts_next_actions():
    print(" ")
    print(" ")
    print("NEXT ACTION")
    print("Enter id to read more")
    print("Or keyword to search")
    print("Or press enter key to go home\n")

    choice = get_user_input('Enter yout choice: ')

    if choice=="":
        display_menu()
    elif choice.isdigit():
        single_post(choice)
    else:
        posts(choice)
    



def posts(term=""):
    clear_screen()
    query = f"SELECT * FROM posts" if term == "" else f"SELECT * FROM posts WHERE category LIKE %s OR title LIKE %s"
    results = execute_query(query, (f'%{term}%',f'%{term}%'), fetch=True) if term != "" else execute_query(query, fetch=True)

    if results:
        for result in results:
            print(f"|{result[0]}. {result[1]}")
            print(f"|{result[2]}")
            print(" ")




    else:
        print(f"No posts found.")
    
    posts_next_actions()


    



# Main program loop
while True:
    print(get_welcome_message())
    display_menu()

    choice = get_user_input("Enter your choice (1-8): ")
    print("\n")

    if choice == "8":
        print("Exiting Healthcare Hub. Goodbye!")
        break
    elif choice == "7":
        share_post()
    elif choice == "6":
        posts()

    else:
        clear_screen()
        column = "category" if choice == "4" else ("topic" if choice == "5" else "name")

        if choice < "6" and len(choice) > 0:
            search_and_filter(category="disease" if choice == "1" else
                    "symptom" if choice == "2" else
                    "drug" if choice == "3" else
                    "flashcard" if choice == "4" else
                    "tip" if choice == "5" else "",
            by_random=(choice == "5"), column=column
        )

    clear_screen()

# Close the cursor and connection
cursor.close()
connection.close()
