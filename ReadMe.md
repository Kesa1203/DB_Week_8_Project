# Projects: Clinic Booking System & Contact Book CRUD API

## Description
This repository contains two distinct projects:

1. **Clinic Booking System**: A relational database designed to streamline clinic operations. It manages patient records, doctor information, appointments, prescriptions, and payments. This project demonstrates best practices in relational database design and data integrity.

2. **Contact Book CRUD API**: A RESTful API built using FastAPI and MySQL. It allows users to manage contacts by performing CRUD operations. The database schema supports additional address details and notes for each contact, showcasing backend programming integrated with database operations.

Both projects focus on usability, scalability, and proper SQL practices while demonstrating practical database and API functionality.

---

## How to Run / Setup the Projects

### Clinic Booking System
1. **Install MySQL**:
   - Install MySQL 8.0 or later from [MySQL's official website](https://dev.mysql.com/downloads/).

2. **Import the Database**:
   - Import the `clinic_booking_system.sql` file into your MySQL database:
     ```bash
     mysql -u [your_username] -p clinic_booking_system < clinic_booking_system.sql
     ```

3. **Verify the Database**:
   - Use any database client (e.g., MySQL Workbench) to explore and query the database.
   - Run the following command to check the tables:
     ```sql
     SHOW TABLES;
     ```

4. **Test the Database**:
   - Insert sample data (if not already included) and run queries to ensure relationships and constraints are working.

---

### Contact Book CRUD API
1. **Install Python**:
   - Install Python 3.8 or later.

2. **Clone the Repository**:
   - Clone this repository and navigate to the project directory.

3. **Install Dependencies**:
   - Install the required Python libraries:
     ```bash
     pip install fastapi uvicorn mysql-connector-python
     ```

4. **Set Up the Database**:
   - Import the `contact_book.sql` file into your MySQL database:
     ```bash
     mysql -u [your_username] -p contact_book < contact_book.sql
     ```

5. **Update Configuration**:
   - Edit the `app.py` file to update the database connection:
     ```python
     db_config = {
         "host": "localhost",
         "user": "your_username",
         "password": "your_password",
         "database": "ContactBook"
     }
     ```

6. **Run the FastAPI Server**:
   - Start the server:
     ```bash
     uvicorn app:app --reload
     ```

7. **Access the API**:
   - Open `http://127.0.0.1:8000/docs` to test the API endpoints using the interactive documentation.

---

## Entity-Relationship Diagrams (ERDs)

### Clinic Booking System ERD
A detailed ERD visually depicts entities such as patients, doctors, appointments, prescriptions, and payments, along with their relationships.

### Contact Book CRUD API ERD
A simplified ERD shows the relationships between `Contacts`, `Address`, and `Notes`.

---

## API Endpoints (Contact Book CRUD API)

### 1. Create a New Contact
- **Method**: `POST`
- **Endpoint**: `/contacts/`
- **Description**: Create a new contact.
- **Example Request Body**:
  ```json
  {
      "first_name": "Jane",
      "last_name": "Doe",
      "email": "jane@example.com",
      "phone_number": "0987654321",
      "address": "456 Elm St"
  }
  ```

## Features

### Clinic Booking System
- **Relational Structure**: Tracks patients, doctors, appointments, prescriptions, and payments.
- **Data Integrity**: Implements `PRIMARY KEY`, `FOREIGN KEY`, `NOT NULL`, and `UNIQUE` constraints.
- **Sample Data**: Includes sample rows for testing and demonstration purposes.

### Contact Book CRUD API
- **CRUD Operations**: Full CRUD functionality for managing contacts.
- **FastAPI Integration**: Lightweight, scalable Python framework for building APIs.
- **Database Connectivity**: Uses MySQL for persistent data storage.
- **Additional Features**: Supports storing shipping and postal addresses, as well as notes for each contact.

---

## Future Enhancements

### Clinic Booking System
- Add support for overdue payment tracking.
- Integrate with external systems for appointment reminders.

### Contact Book CRUD API
- Add user authentication and authorization.
- Implement pagination for listing contacts.
- Add search functionality for contacts by name or email.

---

## Author
**Name**: Sylvester L Kesa 
**Contact**: kesasylvesterlee@gmail.com


