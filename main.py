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
