-- On the other hand, STRING_AGG() is a function provided by Microsoft SQL Server and PostgreSQL. Like GROUP_CONCAT(), it concatenates string values from a specified column into a single string, but it also allows you to specify a custom separator using the WITHIN GROUP keyword.

-- One key difference between STRING_AGG() and GROUP_CONCAT() is that STRING_AGG() also supports the DISTINCT keyword, which allows you to remove duplicate values from the concatenated result.

SELECT customer, STRING_AGG(DISTINCT product, ', ') AS products
FROM orders
GROUP BY customer;

SELECT customer, STRING_AGG(DISTINCT product, ', ' ORDER BY product) AS products
FROM orders
GROUP BY customer;