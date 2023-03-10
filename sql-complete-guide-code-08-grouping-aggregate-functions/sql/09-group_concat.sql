-- GROUP_CONCAT() is a MySQL-specific function that concatenates values from a specified column for each group of rows, separated by a delimiter. GROUP_CONCAT() allows you to order the concatenated values within each group using the ORDER BY clause, and you can also specify a custom separator using the SEPARATOR keyword.

SELECT customer, GROUP_CONCAT(product SEPARATOR ', ') AS products
FROM orders
GROUP BY customer;

SELECT customer, GROUP_CONCAT(product ORDER BY product SEPARATOR ', ') AS products
FROM orders
GROUP BY customer;