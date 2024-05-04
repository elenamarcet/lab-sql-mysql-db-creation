-- Create database
CREATE DATABASE IF NOT EXISTS cars_lab;

USE cars_lab;

-- Drop tables if they exist
DROP TABLE IF EXISTS cars;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS invoices;
DROP TABLE IF EXISTS salespersons;

-- Create cars table
CREATE TABLE cars (
id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
vin VARCHAR(30) NOT NULL, 
manufacturer VARCHAR(50) NOT NULL,
model VARCHAR(50) NOT NULL, 
car_year INT,
color VARCHAR(50) NOT NULL
);

-- Create customers table 
CREATE TABLE customers (
id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
customer_id INT UNSIGNED NOT NULL,
customer_name VARCHAR(50) NOT NULL,
customer_phone VARCHAR(20),
customer_email VARCHAR(50),
customer_address VARCHAR(100),
customer_postalcode INT UNSIGNED NOT NULL,
CONSTRAINT unique_cust_id UNIQUE (customer_id)
);

-- Create salespersons table
CREATE TABLE salespersons (
id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
staff_id VARCHAR(5) NOT NULL, 
name VARCHAR(50) NOT NULL,
store VARCHAR(50) NOT NULL, 
CONSTRAINT unique_staff_id UNIQUE (staff_id)
);

-- Create invoices table
CREATE TABLE invoices (
id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
invoice_number VARCHAR(20) NOT NULL, 
date DATE NOT NULL, 
car_id INT UNSIGNED NOT NULL, 
customer_id INT UNSIGNED NOT NULL, 
salesperson_id INT UNSIGNED NOT NULL, 
CONSTRAINT fk_car_id FOREIGN KEY (car_id) REFERENCES cars(id),
CONSTRAINT fk_customer_id FOREIGN KEY (customer_id) REFERENCES customers(id),
CONSTRAINT fk_salesperson_id FOREIGN KEY (salesperson_id) REFERENCES salespersons(id),
CONSTRAINT unique_invoice_number UNIQUE (invoice_number)
);
