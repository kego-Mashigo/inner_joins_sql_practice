/*
===========================================================
SQL JOINS
===========================================================

1. INNER JOIN
Returns only the rows where there is a matching value
in both tables.

Example:
Table A: 1, 2, 3
Table B: 2, 3, 4
Result: 2, 3


2. LEFT JOIN (LEFT OUTER JOIN)
Returns all rows from the left table and the matching
rows from the right table.

If there is no match, NULL is returned for the right table.


3. RIGHT JOIN (RIGHT OUTER JOIN)
Returns all rows from the right table and the matching
rows from the left table.

If there is no match, NULL is returned for the left table.


4. FULL OUTER JOIN
Returns all rows from both tables.

Where there is no match, NULL is returned for the
missing side.

Note: MySQL does not directly support FULL OUTER JOIN.
It can be simulated using UNION with LEFT JOIN and RIGHT JOIN.


5. SELF JOIN
A table is joined to itself.

It is useful when records within the same table have
relationships with each other.

Example:
An Employees table where one employee is the manager
of another employee.

===========================================================
*/