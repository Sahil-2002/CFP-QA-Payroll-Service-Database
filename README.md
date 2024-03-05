# Payroll Service Database Project

## Overview
This project is a payroll service database designed to manage employee information, salaries, and employment start dates.

## Table Structure
The database consists of the following tables:
- `employees`: Stores information about employees, including their ID, name, salary, and start date.
  - `id` (int unsigned, primary key, auto-increment): Unique identifier for each employee.
  - `name` (varchar(100), not null): Name of the employee.
  - `Salary` (double, not null): Salary of the employee.
  - `Start` (date, not null): Employment start date of the employee.

## Setup Instructions
1. **Database Setup:**
   - Install MySQL or any other compatible relational database management system.
   - Execute the provided SQL script (`create_tables.sql`) to create the necessary tables in your database.

2. **Usage:**
   - Use appropriate SQL commands to interact with the database. Refer to the table structure section for guidance on how to query, insert, update, or delete data.

3. **Running the Project:**
   - Integrate this database with your payroll service application.
   - Ensure proper connection configuration in your application to connect to the database.
   - Implement necessary CRUD (Create, Read, Update, Delete) operations in your application to interact with the database.

## Files Included
- `README.md`: This file providing information about the project.
- `Payroll_service_database`: Contains UC1 TO UC12




