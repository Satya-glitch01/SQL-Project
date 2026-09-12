# Student Management System

This Java-based Student Management System allows you to manage student records with functionalities to add, list, search, update, and delete student details. The system interacts with a MySQL database to store and retrieve student information.

## Features

- **Add Student**: Add new students to the system with details like student ID, name, birthday, and email.
- **List Students**: Display a list of all students in the system.
- **Search Student**: Search for a student by name.
- **Update Student**: Update details of an existing student by entering their student ID.
- **Delete Student**: Remove a student from the system by entering their student ID.
- **Exit**: Terminate the application.

## Prerequisites

- Java Development Kit (JDK) 8 or higher
- MySQL Server
- MySQL Connector/J

## Usage

Upon running the application (`StudentManagementSystem.java`), a menu will display with options to add, list, search, update, or delete student records. You can add a new student by entering their details, list all existing students, search for a student by name, update their information, delete a student by ID, or exit the application. Follow the on-screen prompts for each operation.

## Input Validations and Error Handling

- **Student ID**:
  - Must be a numeric value.
  - The system checks for duplicate IDs to ensure each student has a unique ID.
  - Error message: "Please enter a valid numeric student ID."

- **Name**:
  - Must contain only letters and spaces.
  - Error message: "Invalid name. Name can only contain letters and spaces."


- **Email**:
  - Must contain '@' and '.' to be considered valid.
  - Error message: "Invalid email. Please enter a valid email address."


