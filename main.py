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


# Close the cursor and connection
cursor.close()
connection.close()