import mysql.connector
import os

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
    return "Welcome to Healthcare Hub! Stay healthy and informed."

# Function to display the main menu
def display_menu():
    print("\nHealthcare Hub Console Application\n\n")
    print("1. Disease Information")
    print("2. Symptom Exploration")
    print("3. Drug Exploration")
    print("4. Educational Flashcards")
    print("5. Daily Well-Being Tips")
    print("6. Random tip")
    print("7. Exit")
    print("\n\n")


def get_random_health_tip():
    query = "SELECT * FROM well_being_tips ORDER BY RAND() LIMIT 1"
    cursor.execute(query)
    result = cursor.fetchone()

    if result:
        return f"\nHealth Tip: {result[1]}\n{result[2]}\n"
    else:
        return "\nNo health tips available at the moment.\n"

# Function to handle disease information
def get_disease_info():
    disease_name = input("Enter the name of the disease: ")
    query = "SELECT * FROM diseases WHERE name = %s"
    result = execute_query(query, (disease_name,), fetch=True)

    if result:
        print(result)
    else:
        print("Disease not found.")

# Function to handle symptom exploration
def explore_symptoms():
    search_and_filter("symptom")

# Function to handle drug exploration
def explore_drugs():
    search_and_filter("drug")

# Function to generate educational flashcards
def generate_flashcards():
    category = input("Enter the subject category (e.g., endometriosis, renal diseases): ")
    query = "SELECT * FROM flashcards WHERE category = %s"
    results = execute_query(query, (category,), fetch=True)

    if results:
        for result in results:
            print(result)
    else:
        print("No flashcards found for the specified category.")

# Function to provide daily well-being tips
def get_daily_tips():
    topic = input("Enter the well-being topic (e.g., nutrition, fitness, mental well-being): ")
    query = "SELECT * FROM well_being_tips WHERE topic = %s"
    results = execute_query(query, (topic,), fetch=True)

    if results:
        for result in results:
            print(result)
    else:
        print("No tips found for the specified topic.")

# Function to search and filter information
def search_and_filter(category):
    search_term = input(f"Enter the {category} you want to search for: ")
    query = f"SELECT * FROM {category}s WHERE name LIKE %s"
    results = execute_query(query, (f'%{search_term}%',), fetch=True)

    if results:
        for result in results:
            print(result)
    else:
        print(f"No {category}s found.")


# Function to search and filter information
def clear_screen():
    input("Press Enter to continue...")
    os.system('cls' if os.name == 'nt' else 'clear')  # Clear screen based on OS

# Main program loop
while True:
    print(get_welcome_message())
    display_menu()

    choice = input("Enter your choice (1-6): ")
    print("\n")

    if choice == "1":
        get_disease_info()
    elif choice == "2":
        explore_symptoms()
    elif choice == "3":
        explore_drugs()
    elif choice == "4":
        generate_flashcards()
    elif choice == "5":
        get_daily_tips()
    elif choice == "6":
        print(get_random_health_tip())
    elif choice == "7":
        print("Exiting Healthcare Hub. Goodbye!")
        break
    else:
        print("Invalid choice. Please enter a number between 1 and 6.")
    
    clear_screen()

# Close the cursor and connection
cursor.close()
connection.close()
