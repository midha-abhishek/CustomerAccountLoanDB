-- Query to calculate the total balance across all accounts for each customer:

SELECT c.customer_id, c.first_name, c.last_name, SUM(a.balance) AS total_balance
FROM customers AS c
JOIN accounts AS a
	ON c.customer_id = a.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;

-- Query to calculate the average loan amount for each loan term:

SELECT loan_term, AVG(loan_amount) AS average_loan_amount
FROM loans
GROUP BY loan_term;

-- Query to find the total loan amount and interest across all loans:

SELECT loan_id, loan_amount, interest_rate, loan_term,
    (loan_amount + (loan_amount * (interest_rate / 100) * loan_term)) AS total_loan_amount,
    (loan_amount * (interest_rate / 100) * loan_term) AS total_interest
FROM loans
GROUP BY loan_id, loan_amount, interest_rate, loan_term;

-- Query to find the most frequent transaction type:

SELECT TOP 1 transaction_type, COUNT(*) AS frequency
FROM transactions
GROUP BY transaction_type
ORDER BY frequency DESC;

-- Query to analyze transactions by account and transaction type:

SELECT a.account_id, t.transaction_type,
    COUNT(*) AS transaction_count,
    SUM(t.transaction_amount) AS total_amount
FROM transactions AS t
INNER JOIN accounts AS a
	ON t.account_id = a.account_id
GROUP BY a.account_id, t.transaction_type
ORDER BY a.account_id, t.transaction_type;

