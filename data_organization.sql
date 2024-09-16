DROP TABLE IF EXISTS loan_payments;
DROP TABLE IF EXISTS loans;
DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS accounts;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
	customer_id INT PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	address VARCHAR(100),
	city VARCHAR(50),
	state VARCHAR(50),
	zip VARCHAR(20)
);

SELECT * FROM customers;

CREATE TABLE accounts (
	account_id INT PRIMARY KEY,
	customer_id INT,
	account_type VARCHAR(50),
	balance DECIMAL(10, 2),
	FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

SELECT * FROM accounts;

CREATE TABLE transactions (
	transaction_id INT PRIMARY KEY,
	account_id INT,
	transaction_date DATE,
	transaction_amount DECIMAL(10, 2),
	transaction_type VARCHAR(10),
	FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);

SELECT * FROM transactions;

CREATE TABLE loans (
	loan_id INT PRIMARY KEY,
	customer_id INT,
	loan_amount DECIMAL(10, 2),
	interest_rate DECIMAL(5, 2),
	loan_term INT,
	FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

SELECT * FROM loans;

CREATE TABLE loan_payments (
	payment_id INT PRIMARY KEY,
	loan_id INT,
	payment_date DATE,
	payment_amount DECIMAL(10, 2),
	FOREIGN KEY (loan_id) REFERENCES loans(loan_id)
);

SELECT * FROM loan_payments;

