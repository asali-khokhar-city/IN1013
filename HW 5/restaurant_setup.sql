DROP DATABASE IF EXISTS restaurant_database;
CREATE DATABASE restaurant_database;
USE restaurant_database;

DROP TABLE IF EXISTS restStaff, restRest_table, restRoom_management, restBill;

CREATE TABLE restStaff (
    staff_no INTEGER PRIMARY KEY,
    first_name VARCHAR(15),
    surname VARCHAR(15),
    headwaiter INTEGER,
    FOREIGN KEY (headwaiter) REFERENCES restStaff(staff_no)
);

CREATE TABLE restRest_table (
    table_no INTEGER PRIMARY KEY,
    no_of_seats INTEGER,
    room_name VARCHAR(5)
);

CREATE TABLE restRoom_management (
    room_name VARCHAR(15),
    room_date INTEGER,
    headwaiter INTEGER,
    FOREIGN KEY (headwaiter) REFERENCES restStaff (staff_no),
    PRIMARY KEY (room_name, room_date)
);

create table restBill (
    bill_no INTEGER PRIMARY KEY,
    bill_date INTEGER,
    bill_total DECIMAL(6,2),
    cust_name CHAR(20),
    covers INTEGER,
    table_no INTEGER,
    waiter_no INTEGER,
    FOREIGN KEY (table_no) REFERENCES restRest_table (table_no),
    FOREIGN KEY (waiter_no) REFERENCES restStaff (staff_no)
);


INSERT INTO restStaff VALUES
    (005, 'Alphonso', 'Moss', NULL),
    (006, 'Jack', 'Hunt', NULL),
    (010, 'Charles','Watson', NULL),
    (001, 'John', 'Paul', 005),
    (002, 'Paul', 'Smith', 006),
    (003, 'Zoe', 'Ball', 005),
    (004, 'Sam', 'Pitt', 006),
    (007, 'Jimmy', 'Smith', 005),
    (008, 'Tim', 'Jackson', 005),
    (009, 'David', 'Campbell', 006),
    (011, 'Chris', 'Smart', 010);

INSERT INTO restRest_table VALUES
    (001, 7, 'Blue'),
    (002, 6, 'Blue'),
    (003, 10, 'Blue'),
    (004, 7, 'Red'),
    (005, 4, 'Red'),
    (006, 7, 'Red'),
    (007, 6, 'Red'),
    (008, 6, 'Green'),
    (009, 5, 'Green');

INSERT INTO restRoom_management VALUES
    ('Blue', 160312, 005),
    ('Blue', 160105, 005),   
    ('Blue', 160210, 006),
    ('Blue', 160215, 005),
    ('Blue', 150614, 005),
    ('Red', 160307, 006),
    ('Red', 151231, 006),
    ('Red', 160111, 006),
    ('Red', 160312, 005),
    ('Red', 160210, 005),
    ('Red', 160115, 006),
    ('Green', 160105, 010),
    ('Green', 160111, 010),
    ('Green', 160215, 010),
    ('Green', 151231, 010);
       
INSERT INTO restBill VALUES
    (00001, 160312, 200.99, 'Tony Beebee', 3, 001, 002),
    (00002, 160105, 500.47, 'David Hookman', 7, 002, 003),         
    (00003, 151231, 400.33, 'Jack Pitt', 4, 005, 004),         
    (00004, 151231, 600.91, 'Bob Crow', 2, 004, 004),             
    (00005, 150614, 400.23, 'Beck Smith', 7, 006, 002),
    (00007, 160111, 237.37, 'Terry Jones', 4, 004, 002),
    (00008, 160111, 396.00, 'Tony Beebee', 2, 005, 004),
    (00009, 160111, 101.00, 'Tanya Singh', 1, 006, 004),
    (00010, 160111, 272.01, 'Bob Crow', 3, 008, 011),
    (00011, 160111, 777.11, 'Nerida Smith', 5, 009, 011),
    (00012, 160312, 1665.27, 'David Hookman', 10, 003, 003),
    (00013, 160312, 831.00, 'Tanya Singh', 4, 001, 008),
    (00014, 151231, 555.66, 'Terry Jones', 3, 008, 011),
    (00015, 151231, 102.35, 'Sunil Shah', 2, 009, 011),
    (00016, 160111, 232.11, 'Bob Crow', 4, 009, 011),
    (00017, 160210, 311.11, 'Tanya Singh', 2, 001, 003),
    (00018, 160210, 89.99, 'Bob Crow', 3, 006, 009),
    (00019, 160210, 109.31, 'Nerida Smith', 2, 008, 011),
    (00020, 160215, 444.44, 'Bob Crow', 4, 001, 007),
    (00021, 160215, 131.11, 'Nancy Smith', 2, 009, 011),
    (00022, 160312, 545.01, 'Sunil Shah', 4, 006, 004);

-- TASK ONE

-- 1

SELECT bill_date, bill_total
FROM restBill
WHERE cust_name = "Bob Crow";

-- 2

SELECT DISTINCT cust_name
FROM restBill
WHERE cust_name LIKE "%Smith"
ORDER BY cust_name DESC;

-- 3

SELECT DISTINCT cust_name
FROM restBill
WHERE cust_name LIKE "_%C%";

-- 4

SELECT first_name, surname
FROM restStaff
WHERE headwaiter IS NOT NULL;

-- 5

SELECT * 
FROM restBill
WHERE bill_date LIKE "1602%";

-- 6

SELECT DISTINCT bill_date
FROM restBill
WHERE bill_date BETWEEN 150000 AND 159999
ORDER BY bill_date DESC;

-- TASK TWO

-- 1

SELECT SUM(bill_total) AS "Income"
FROM restBill;

-- 2

SELECT SUM(bill_total) AS "Feb Income"
FROM restBill
WHERE bill_date LIKE "1602%";

-- 3

SELECT AVG(bill_total)
FROM restBill
WHERE table_no = "2";

-- 4

SELECT MIN(no_of_seats) AS "Min", MAX(no_of_seats) AS "Max", AVG(no_of_seats) AS "Avg"
FROM restRest_table
WHERE room_name = "BLUE";

-- 5

SELECT COUNT(DISTINCT table_no)
FROM restBill
WHERE waiter_no = "004"
OR waiter_no = "002";

-- TASK THREE (UNFINISHED)

-- 1

-- ?

SELECT restStaff.first_name, restStaff.surname
FROM restStaff, restBill
INNER JOIN restStaff ON restStaff.staff_no = restBill.waiter_no
WHERE restBill.cust_name = "Tanya Singh";

-- 2

-- ?

SELECT restRoom_management.room_date
FROM restRoom_management
INNER JOIN restRoom_management.headwaiter = restStaff.staff_no
WHERE restStaff.first_name = "Charles"
AND restRoom_management.room_date LIKE "1602%"
AND restRoom_management.room_name = "Green";

-- 3

SELECT first_name, surname
FROM restStaff
WHERE headwaiter = 
    (SELECT headwaiter
    FROM restStaff
    WHERE first_name = "Zoe"
    AND surname = "Ball");

-- 4

-- ?

SELECT restBill.cust_name, restBill.bill_total, restStaff.first_name, restStaff.first_name
FROM restBill, restStaff
INNER JOIN restBill.waiter_no = restStaff.staff_no
ORDER BY restBill.bill_total DESC;

-- 5

-- ?

SELECT restStaff.first_name, restStaff.surname
FROM restStaff
INNER JOIN restBill.waiter_no = restStaff.staff_no
WHERE headwaiter =
    (SELECT restStaff.headwaiter
    FROM restStaff
    INNER JOIN restBill.waiter_no = restStaff.staff_no
    WHERE restBill.waiter_no = "00014")
OR headwaiter =
    (SELECT restStaff.headwaiter
    FROM restStaff
    INNER JOIN restBill.waiter_no = restStaff.staff_no
    WHERE restBill.waiter_no = "00017");

-- 6

-- ?

SELECT restStaff.first_name, restStaff.surname
FROM restStaff
INNER JOIN restStaff.staff_no = restRoom_management.headwaiter
WHERE restStaff.staff_no = restRoom_management.headwaiter
OR restStaff.headwaiter = restRoom_management.headwaiter;