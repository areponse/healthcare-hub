# Improved menu display for better user interaction
def display_menu():
    # Updated menu layout for clarity
    print("Welcome to HealthCare Hub!")
    print("1. Search")
    print("2. Disease Information")
    print("3. Symptom Exploration")
    print("4. Flashcards")
    print("5. Daily Well-Being Tips")
    print("6. Exit")

# Code looping the program and invoking the display_menu function
while True:
    display_menu()
    choice = input("Enter your choice: ")

    # Add code here to handle user choices (e.g., search, disease info, etc.)
    # Ensure graceful program exits and handle user input appropriately
