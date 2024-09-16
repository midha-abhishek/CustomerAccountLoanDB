-- Query to retreive all customer information:

SELECT * FROM customers;

-- Query to retreive accounts for a specific customer:

SELECT * FROM accounts
WHERE customer_id = 12;

-- Query to find the customers name and account balance for each account:

SELECT a.account_id, a.customer_id, c.first_name, c.last_name, a.balance
FROM accounts AS a
LEFT JOIN customers AS c
	ON a.customer_id = c.customer_id;

-- Query to analyze customer loan balances:

SELECT c.customer_id, c.first_name, c.last_name, l.loan_id, l.loan_amount, l.interest_rate, l.loan_term,
	(l.loan_amount + (l.loan_amount * (l.interest_rate / 100) * l.loan_term)) AS total_due_with_interest,
	COALESCE(SUM(lp.payment_amount), 0) AS total_paid,
	((l.loan_amount + (l.loan_amount * (l.interest_rate / 100) * l.loan_term)) - COALESCE(SUM(lp.payment_amount), 0)) AS loan_balance
FROM customers AS c
INNER JOIN loans AS l
	ON c.customer_id = l.customer_id
	LEFT JOIN loan_payments AS lp
		ON l.loan_id = lp.loan_id
GROUP BY c.customer_id, c.first_name, c.Last_name, l.loan_id, l.loan_amount, l.interest_rate, l.loan_term
ORDER BY c.customer_id;

-- Query to list all the customers who made a transaction in 2024-03:

SELECT DISTINCT c.customer_id, c.first_name, c.last_name
FROM customers AS c
INNER JOIN accounts AS a
	ON c.customer_id = a.customer_id
	INNER JOIN transactions AS t
		ON a.account_id = t.account_id
WHERE t.transaction_date BETWEEN '2024-03-01' AND '2024-03-31';

