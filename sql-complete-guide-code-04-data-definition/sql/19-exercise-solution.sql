--Task 1: Create Database
CREATE DATABASE online_shop;
--Tasks 2 + 3: Create and configure table
CREATE TABLE products (
  name VARCHAR(200),
  price NUMERIC(10,2), -- 8.99, 12345.99
  description TEXT,
  amount_in_stock SMALLINT,
  image_path VARCHAR(500) -- 'uploads/images/products/some-product.jpg'
);
--Task 4: Inserting dummy data
INSERT INTO products (
    price,
    name,
    description,
    amount_in_stock,
    image_path
  )
VALUES (
    12.99,
    'A Book',
    'This is a book - and this text could be way longer!',
    39,
    'uploads/images/products/a-book.jpg'
  );

--Task 5: Add constraints

ALTER TABLE products
-- MODIFY COLUMN name VARCHAR(200) NOT NULL,
-- MODIFY COLUMN price NUMERIC(10,2) NOT NULL CHECK (price > 0),
-- MODIFY COLUMN description TEXT NOT NULL,
-- MODIFY COLUMN amount_in_stock SMALLINT CHECK (amount_in_stock >= 0);
ALTER COLUMN name SET NOT NULL,
ALTER COLUMN price SET NOT NULL,
ALTER COLUMN price SET DEFAULT 0,
ALTER COLUMN description SET NOT NULL,
ALTER COLUMN description SET DATA TYPE VARCHAR(500),
ADD CONSTRAINT price_positive CHECK (price > 0),
ADD CONSTRAINT amount_in_stock_positive CHECK (amount_in_stock >= 0)
ADD CONSTRAINT path_unique UNIQUE(image_path); --ADD CONSTRAINT path_unique UNIQUE(col1, col2, ...) means values into col1 col2 must be unique pairs

ALTER TABLE products
--ALTER COLUMN description DROP NOT NULL,
DROP CONSTRAINT amount_in_stock_positive;

--Task 6: update an 'A Book' price and amount in stock
UPDATE products
SET 
  price = 14.99, 
  amount_in_stock = 15
WHERE name = 'A Book';


--Task 7: Add id column

ALTER TABLE products
ADD COLUMN id SERIAL PRIMARY KEY;
-- ADD COLUMN id INT PRIMARY KEY AUTO_INCREMENT;