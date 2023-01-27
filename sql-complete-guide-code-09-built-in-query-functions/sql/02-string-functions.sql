SELECT CONCAT(first_name, ' ',last_name)
FROM memberships;

--postgreSQL only
SELECT first_name || ' ' || last_name
FROM memberships;

SELECT CONCAT('$ ', price)
FROM memberships;

SELECT REPLACE(first_name, 'o', 'O') AS ExtractString --replace 'o' in first_name string with 'O';
FROM memberships;

SELECT first_name 
FROM memberships
WHERE SUBSTRING(last_name, 1, 1) LIKE 'Ok%'; --SUBSTRING(string, start, length) --> start--> character to start extraction from 1 == first character, 2 == 2nd character, etc; length --> no of chars to be extracted. If length is not specified, it copies from start to end of the character

SELECT LEFT(first_name, 5) AS ExtractString --Extract 5 characters from the text in the "first_name" column (starting from left):
FROM memberships;

SELECT RIGHT(first_name, 5) AS ExtractString --Extract 5 characters from the text in the "first_name" column (starting from right):
FROM memberships;

INSERT INTO memberships (
    membership_start,
    membership_end,
    last_checkin,
    last_checkout,
    consumption,
    first_name,
    last_name,
    price,
    billing_frequency,
    gender

)
VALUES (
    '2021-10-18',
    '2021-11-18',
    '2021-11-01 08:56:01',
    '2021-11-01 09:20:12',
    NULL,
    'John',
    'Doe',
    19.99,
    12,
    LOWER('DivErs')
);

SELECT * FROM memberships
WHERE LENGTH(last_name) < 7;

INSERT INTO memberships (
    membership_start,
    membership_end,
    last_checkin,
    last_checkout,
    consumption,
    first_name,
    last_name,
    price,
    billing_frequency,
    gender

)
VALUES (
    '2021-05-02',
    NULL,
    '2021-06-05 11:52:25',
    '2021-06-05 11:58:08',
    NULL,
    'Monti',
    'Durns',
    199.99,
    1,
    TRIM(TRAILING 'b ' FROM 'maleb  ')
); 

SELECT LENGTH(gender) FROM memberships;

