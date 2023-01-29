CREATE TABLE cities (
  name VARCHAR(200) PRIMARY KEY
);

CREATE TABLE locations (
  -- id INT PRIMARY KEY AUTO_INCREMENT, -- MySQL
  id SERIAL PRIMARY KEY, -- Postgresl
  title VARCHAR(300),
  street VARCHAR(300) NOT NULL,
  house_number VARCHAR(10) NOT NULL,
  postal_code VARCHAR(5) NOT NULL,
  city_name VARCHAR(200) REFERENCES cities ON DELETE RESTRICT ON UPDATE CASCADE --city_name is a column used as the foreign key column to reference the primary key of the cities table (manytoone), the delete of a city record is restricted and when a city record is updated it is also updated in the many records in locations where it is referenced
);

CREATE TABLE users (
  -- id INT PRIMARY KEY AUTO_INCREMENT, -- MySQL
  id SERIAL PRIMARY KEY, -- Postgresl
  first_name VARCHAR(300) NOT NULL,
  last_name VARCHAR(300) NOT NULL,
  birthdate DATE NOT NULL,
  email VARCHAR(300) NOT NULL
);

CREATE TABLE organizers (
  password VARCHAR(500) NOT NULL,
  user_id INT PRIMARY KEY REFERENCES users ON DELETE CASCADE -- organizers table has onetoone relationship with users. so we have a foreign key column user_id which references the primary key of the users table. This column is then also used as the primary column as it will always be not null && unique (the would never be 2 records with the same user_id on user table as it is onetoone)
);

CREATE TABLE tags (
  name VARCHAR(100) PRIMARY KEY
);

CREATE TABLE events (
  -- id INT PRIMARY KEY AUTO_INCREMENT, -- MySQL
  id SERIAL PRIMARY KEY, -- Postgresl
  name VARCHAR(300) NOT NULL CHECK (LENGTH(name) > 5),
  date_planned TIMESTAMP NOT NULL,
  image VARCHAR(300),
  description TEXT NOT NULL,
  max_participants INT CHECK (max_participants > 0),
  min_age INT CHECK (min_age > 0),
  location_id INT REFERENCES locations ON DELETE CASCADE,
  organizer_id INT REFERENCES organizers ON DELETE CASCADE
);


CREATE TABLE events_users (
  event_id INT REFERENCES events ON DELETE CASCADE,
  user_id INT REFERENCES users ON DELETE CASCADE,
  PRIMARY KEY (event_id, user_id) -- events_users is a joining/intermedidary table for manytomany events and users tables with only 2 fields (columns): event_id user_id which are both foreign keys reference to the primary key of their tables: events and users. The table has a composite primary key which is made from the 2 columns. [more than 2 columns can make a composite primary key]
);

CREATE TABLE events_tags (
  event_id INT REFERENCES events ON DELETE CASCADE,
  tag_name VARCHAR(100) REFERENCES tags ON DELETE CASCADE,
  PRIMARY KEY (event_id, tag_name)
);