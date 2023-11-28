# Healthcare Hub Console Application

## Project Overview

The Healthcare Hub Console Application is a Python-based program designed to provide users with a comprehensive platform for health educational enrichment and daily well-being insights. The application offers a menu-driven console interface, ensuring a user-friendly experience.

## Features

- **Disease Information:** Retrieve detailed information about specific diseases.
- **Symptom Exploration:** Explore and learn about various symptoms associated with different health conditions.
- **Drug Exploration:** Access comprehensive information on drugs, including uses and side effects.
- **Educational Flashcards:** Generate flashcards with questions related to medical knowledge.
- **Daily Well-Being Tips:** Get daily tips on nutrition, fitness, and mental well-being.

## Getting Started

1. Clone the repository.
2. Install the required dependencies.
   ```bash
   pip install mysql-connector-python
   ```
3. Get database running: Have mysql running with data from database.sql
   `database.sql`
4. Change your connection creadentials in `main.py`
   Replace with your use case values
   ```bash
    host="your_host",
    user="your_username",
    password="your_password",
    database="your_dbname"
   ```
   In our case this is what we used, you may prefer that for simplicity
   ```bash
    host="localhost",
    user="root",
    password="",
    database="healthcare_hub"
   ```
5. Run the application
   ```bash
   py main.py
   ```

## Usage

Follow the on-screen prompts to navigate through different features of the application.
