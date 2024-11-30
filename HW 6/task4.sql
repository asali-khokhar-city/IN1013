-- 1

SELECT restBill.cust_name
FROM restBill
INNER JOIN restStaff 
ON restBill.waiter_no = restStaff.staff_no
AND bill_total > 450.0
AND restStaff.headwaiter =
    (SELECT staff_no
    FROM restStaff
    WHERE first_name = "Charles");

-- 2

SELECT first_name, surname
FROM restStaff
WHERE staff_no =
    (SELECT headwaiter
    FROM restStaff
    WHERE staff_no = 
        (SELECT restBill.waiter_no
        FROM restBill
        WHERE restBill.bill_date = "160111"
        AND restBill.cust_name LIKE "Nerida%"));

-- 3

SELECT cust_name
FROM restBill
WHERE bill_total = (
    SELECT MIN(bill_total)
    FROM restBill
);

-- 4

SELECT first_name, surname
FROM restStaff
WHERE staff_no NOT in (
    SELECT DISTINCT waiter_no
    FROM restBill
);

-- 5

SELECT DISTINCT restBill.cust_name, restStaff.first_name, restStaff.surname, restRoom_management.room_name
FROM restBill
INNER JOIN restRest_table
ON restBill.covers = restRest_table.no_of_seats
INNER JOIN restRoom_management
ON restRest_table.room_name = restRoom_management.room_name
INNER JOIN restStaff
ON restStaff.staff_no = restBill.waiter_no
WHERE restBill.bill_total = (
    SELECT MAX(bill_total)
    FROM restBill
);