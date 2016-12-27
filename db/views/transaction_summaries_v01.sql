SELECT t.*, a.overdraft + t.balance as available 
FROM (
  SELECT *, sum(amount) OVER (
    PARTITION BY account_id 
    ORDER BY processed_on 
    ROWS UNBOUNDED PRECEDING
  ) as balance
  FROM transactions
) t 
JOIN accounts a ON a.id = t.account_id