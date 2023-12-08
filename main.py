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
