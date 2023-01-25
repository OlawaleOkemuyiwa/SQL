--SUBQUERY
CREATE VIEW base_result AS SELECT * FROM sales
WHERE volume > 1000;

SELECT customer_name, product_name
FROM base_result;

OR 

SELECT customer_name, product_name FROM (
  SELECT * FROM sales
  WHERE volume > 1000;
) AS base_result;

