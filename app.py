from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
import mysql.connector

app = FastAPI()

# Database configuration
db_config = {
    "host": "localhost",
    "user": "root",
    "password": "password",
    "database": "ContactBook"
}

# Contact model
class Contact(BaseModel):
    first_name: str
    last_name: str
    email: str
    phone_number: str
    address: str = None

# Helper function for database operations
def execute_query(query, params=None, fetch_one=False, fetch_all=False):
    conn = mysql.connector.connect(**db_config)
    cursor = conn.cursor(dictionary=True)
    try:
        cursor.execute(query, params)
        if fetch_one:
            return cursor.fetchone()
        if fetch_all:
            return cursor.fetchall()
        conn.commit()
    finally:
        cursor.close()
        conn.close()

# Create a new contact
@app.post("/contacts/")
def create_contact(contact: Contact):
    query = """
        INSERT INTO Contacts (FirstName, LastName, Email, PhoneNumber, Address)
        VALUES (%s, %s, %s, %s, %s)
    """
    try:
        execute_query(query, (contact.first_name, contact.last_name, contact.email, contact.phone_number, contact.address))
        return {"message": "Contact created successfully"}
    except mysql.connector.Error as err:
        raise HTTPException(status_code=400, detail=str(err))

# Get all contacts
@app.get("/contacts/")
def get_contacts():
    query = "SELECT * FROM Contacts"
    return execute_query(query, fetch_all=True)

# Get a contact by ID
@app.get("/contacts/{contact_id}")
def get_contact(contact_id: int):
    query = "SELECT * FROM Contacts WHERE ContactID = %s"
    contact = execute_query(query, (contact_id,), fetch_one=True)
    if not contact:
        raise HTTPException(status_code=404, detail="Contact not found")
    return contact

# Update a contact
@app.put("/contacts/{contact_id}")
def update_contact(contact_id: int, contact: Contact):
    query = """
        UPDATE Contacts
        SET FirstName = %s, LastName = %s, Email = %s, PhoneNumber = %s, Address = %s
        WHERE ContactID = %s
    """
    execute_query(query, (contact.first_name, contact.last_name, contact.email, contact.phone_number, contact.address, contact_id))
    return {"message": "Contact updated successfully"}

# Delete a contact
@app.delete("/contacts/{contact_id}")
def delete_contact(contact_id: int):
    query = "DELETE FROM Contacts WHERE ContactID = %s"
    execute_query(query, (contact_id,))
    return {"message": "Contact deleted successfully"}