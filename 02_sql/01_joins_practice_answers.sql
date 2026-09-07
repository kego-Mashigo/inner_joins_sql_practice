--INNER JOIN
--20. List the description and amount of every transaction made by someone living in Durban.
SELECT TOP (1000) A.[transaction_id]
      ,A.[person_id]
      ,A.[description]
      ,A.[amount]
      ,A.[transaction_type]
      ,B.[first_name]
      ,B.[last_name]
      ,B.[city]
FROM [Bank_Transactions].[dbo].[transactions] A
INNER JOIN
[Bank_Transactions].[dbo].[people] B
ON A.person_id = B.person_id
WHERE City = 'Durban'

--21. Show the full name and email of every person who has made at least one withdrawal.

SELECT A.[transaction_id]
      ,A.[person_id]
      ,B.[first_name]
      ,B.[email]
      ,A.[transaction_type]   
FROM [Bank_Transactions].[dbo].[transactions] A
INNER JOIN
[Bank_Transactions].[dbo].[people] B
ON A.person_id = B.person_id
WHERE A.person_id > 1 AND transaction_type = 'Withdrawal'

   
-- If the question asked name and email of every person who made more than one withdrawal

SELECT A.[transaction_id]
      ,A.[person_id]
      ,B.[first_name]
      ,B.[email]
      ,A.[transaction_type]   
FROM [Bank_Transactions].[dbo].[transactions] A
INNER JOIN
[Bank_Transactions].[dbo].[people] B
ON A.person_id = B.person_id
WHERE A.person_id > 2 AND transaction_type = 'Withdrawal'
ORDER BY first_name


--22. Find all transactions made in January 2025, along with the person's full name.

SELECT A.[transaction_id]
      ,A.[person_id]
      ,A.[transaction_date] 
      ,B.[first_name]
      ,B.[last_name] 
FROM [Bank_Transactions].[dbo].[transactions] A
INNER JOIN
[Bank_Transactions].[dbo].[people] B
ON A.person_id = B.person_id
WHERE transaction_date  BETWEEN '2025-01-01' AND '2025-01-31'

 
--23. List every person-transaction pair where the transaction amount is negative (money going out).
-- Business point of view:
-- Payment = Money deducted from the perso's account when they made any form of payment.
-- Withdrawal = Money deducted from the person's account when they request to get physical cash from the ATM.

SELECT A.[transaction_id]
      ,A.[person_id]
      ,B.[first_name]
      ,A.[amount]
      ,A.[transaction_type]
FROM [Bank_Transactions].[dbo].[transactions] A
INNER JOIN
[Bank_Transactions].[dbo].[people] B
ON A.person_id = B.person_id
WHERE amount < 0  
ORDER BY transaction_type

  
--LEFT JOIN
--24. List every person along with their most recent transaction date (NULL if they have none).

SELECT A.[transaction_id]
      ,A.[person_id]
      ,B.[first_name]
      ,MAX (A.[transaction_date]) AS recent_transaction_date
FROM [Bank_Transactions].[dbo].[transactions] A
LEFT JOIN
[Bank_Transactions].[dbo].[people] B
ON A.person_id = B.person_id
GROUP BY  A.[transaction_id]
         ,A.[person_id]
         ,B.[first_name]
ORDER BY recent_transaction_date DESC


--25. Show all people and the number of transactions they've made, including 0 for those with none.


--26. Find people whose only transactions (if any) are deposits — including people with zero transactions.


--27. List all people and a column that says 'Has activity' or 'No activity' based on whether they appear in transactions.


--RIGHT JOIN
--28. List every transaction along with the person's city — show NULL city for orphaned transactions.


--29. Find the total amount of money attached to transactions that have no matching person.


--30. Show all transactions ordered by amount, including a flag for whether the person_id is valid.


--FULL OUTER JOIN
--31. Produce one combined view of people and transactions showing every person (even with no transactions) and every transaction (even orphaned), with NULLs on whichever side is missing.


--32. From that FULL OUTER JOIN result, count how many rows have a NULL person_id vs how many have a NULL transaction_id.



--AGGREGATION + JOIN
--33. Find the total number of transactions and total amount per city.


--34. Find each person's largest single transaction (MAX amount).


--35. Find each person's smallest (most negative) transaction.


--36. Rank people by total transaction volume (sum of absolute amount) from highest to lowest.


--37. Find the average number of transactions per person across the whole table.


--38. Find which city has the highest total deposit amount.

--FILTERING + JOIN
--39. Find all people who made at least one transaction over 10,000.


--40. Find all people who have made both a deposit AND a withdrawal.


--41. Find all transactions made by people NOT living in Cape Town.


--42. Find people who made a transaction in February 2025 but not in January 2025.


--43. List people who have exactly one transaction (not zero, not many).


--SELF-JOIN / COMPARISON
--44. Find pairs of people born in the same year (self-join on people using date_of_birth).


--45. For each city with more than one person, list all the people in it side by side.


--46. Find people whose total transaction amount is higher than the average across all people.

--MULTIPLE / CHAINED JOINS
--47. Imagine a third table `cities (city_name, region)`. Join people → transactions → cities to show each transaction's region.


--48. Imagine a third table `transaction_categories (transaction_type, category_group)`. Join transactions → transaction_categories → people to show each person's spending by category_group.


--TRICKY EDGE CASES
--49. Find people who exist in `people` but whose person_id never appears as a foreign key anywhere (same idea as an unused customer).


--50. Without using a WHERE clause, use conditional aggregation (CASE WHEN + SUM) to show each person's total deposits and total withdrawals as two separate columns in one row.

