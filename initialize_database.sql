-- Database Creation Script
-- ========================

-- This script establishes the structure of the database. It defines 
-- the complete  schema by creating all necessary tables (including 
-- `Clients`, `Projects`, `Sessions`, and `Employees`) and enforces 
-- data integrity through the use of primary keys, foreign keys, and 
-- specific constraints like `CHECK` and `UNIQUE`.

CREATE DATABASE VD_Studio
GO

USE VD_Studio
GO

CREATE TABLE Clients (
    client_id INT NOT NULL IDENTITY PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    email VARCHAR(50) UNIQUE,
    town VARCHAR(50),
    address VARCHAR(50),
    company_number VARCHAR(13) CHECK(LEN(company_number) IN (9, 13)),
    VAT_number CHAR(11)
)

CREATE TABLE Project_types (
    type_id TINYINT NOT NULL IDENTITY PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
)

CREATE TABLE Projects (
    project_id INT NOT NULL IDENTITY PRIMARY KEY,
    type_id TINYINT NOT NULL REFERENCES Project_types(type_id),
    client_id INT NOT NULL REFERENCES Clients(client_id),
    name VARCHAR(100),
    contract_number INT,
    contract_date DATE,
    price MONEY,
    is_paid BIT NOT NULL DEFAULT 0,
    is_completed BIT NOT NULL DEFAULT 0,
    additional_notes VARCHAR(MAX)
)

CREATE TABLE Sessions (
    session_id INT NOT NULL IDENTITY PRIMARY KEY,
    project_id INT NOT NULL REFERENCES Projects(project_id),
    location VARCHAR(100),
    date_and_time DATETIME
)

CREATE TABLE Employees (
    employee_id INT NOT NULL IDENTITY PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    surname VARCHAR(30) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    phone VARCHAR(15) NOT NULL,
    town VARCHAR(50) NOT NULL,
    address VARCHAR(50) NOT NULL,
    is_active BIT NOT NULL DEFAULT 1
)

CREATE TABLE Session_teams (
    session_id INT NOT NULL REFERENCES Sessions(session_id),
    employee_id INT NOT NULL REFERENCES Employees(employee_id),
    role VARCHAR(50) NOT NULL,
    PRIMARY KEY (session_id, employee_id)
)

CREATE TABLE Skills (
    skill_id TINYINT NOT NULL IDENTITY PRIMARY KEY,
    name VARCHAR(20) NOT NULL UNIQUE
)

CREATE TABLE Employee_skills (
    employee_id INT NOT NULL REFERENCES Employees(employee_id),
    skill_id TINYINT NOT NULL REFERENCES Skills(skill_id),
    level_of_skill TINYINT CHECK(level_of_skill BETWEEN 1 AND 5),
    PRIMARY KEY (employee_id, skill_id)
)

GO