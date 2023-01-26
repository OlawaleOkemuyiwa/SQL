SELECT * 
FROM employees AS e1
INNER JOIN employees AS e2 ON e1.supervisor_id = e2.id;
--self referencing: see a self referencing table as FIRST a many table with a foreign key constraint column whose many records can reference one record in another table (which is the same table)