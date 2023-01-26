CREATE TABLE employees (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(300) NOT NULL,
  last_name VARCHAR(300) NOT NULL,
  supervisor_id INT REFERENCES employees ON DELETE SET NULL
);
--self referencing: see a self referencing table as FIRST a many table with a foreign key constraint column whose many records can reference one record in another table (which is the same table)