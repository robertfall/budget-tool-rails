SELECT *, sum(amount) OVER (
  PARTITION BY account_id 
  ORDER BY processed_on 
  ROWS UNBOUNDED PRECEDING
) as balance
FROM transactions