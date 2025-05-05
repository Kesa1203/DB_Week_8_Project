-- Create the database
CREATE DATABASE ContactBook;

-- Use the database
USE ContactBook;

-- Create the Contacts table
CREATE TABLE Contacts (
    ContactID INT AUTO_INCREMENT PRIMARY KEY, -- Unique identifier for each contact
    FirstName VARCHAR(50) NOT NULL, -- Contact's first name
    LastName VARCHAR(50) NOT NULL, -- Contact's last name
    Email VARCHAR(100) UNIQUE NOT NULL, -- Contact's email (must be unique)
    PhoneNumber VARCHAR(15) UNIQUE NOT NULL, -- Contact's phone number (must be unique)
    Address TEXT -- Contact's address
);

-- Create the Address table
CREATE TABLE Address (
    AddressID INT AUTO_INCREMENT PRIMARY KEY, -- Unique identifier for each address
    ContactID INT NOT NULL, -- Foreign key referencing Contacts table
    ShippingAddress TEXT NOT NULL, -- Shipping address
    PostalAddress TEXT, -- Postal address
    FOREIGN KEY (ContactID) REFERENCES Contacts(ContactID) -- Define foreign key constraint
);

-- Create the Notes table
CREATE TABLE Notes (
    NoteID INT AUTO_INCREMENT PRIMARY KEY, -- Unique identifier for each note
    ContactID INT NOT NULL, -- Foreign key referencing Contacts table
    NoteText TEXT NOT NULL, -- The content of the note
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP, -- Timestamp for when the note was created
    FOREIGN KEY (ContactID) REFERENCES Contacts(ContactID) -- Define foreign key constraint
);