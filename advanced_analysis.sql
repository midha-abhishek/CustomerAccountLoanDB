DROP VIEW IF EXISTS ActiveLoansWithLargePayments;

-- Creating a view of active loans with payments greater than $1000:

CREATE VIEW ActiveLoansWithLargePayments AS
SELECT l.loan_id, l.customer_id, l.loan_amount, l.interest_rate, l.loan_term, lp.payment_id, lp.payment_date, lp.payment_amount
FROM loans AS l
JOIN loan_payments AS lp
	ON l.loan_id = lp.loan_id
WHERE lp.payment_amount > 1000;

SELECT TOP 10 * FROM ActiveLoansWithLargePayments;

-- Creating an index on `transaction_date` in the `transactions` table for performance optimization:

CREATE INDEX idx_transaction_date ON transactions (transaction_date);

