-- 1

SELECT restStaff.first_name, restStaff.surname
FROM restBill
INNER JOIN restStaff ON restStaff.staff_no = restBill.waiter_no
WHERE restBill.cust_name = "Tanya Singh";

-- 2

SELECT restRoom_management.room_date
FROM restStaff
INNER JOIN restRoom_management
ON restRoom_management.headwaiter = restStaff.staff_no
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

SELECT restBill.cust_name, restBill.bill_total, restStaff.first_name, restStaff.first_name
FROM restBill
INNER JOIN restStaff
ON restBill.waiter_no = restStaff.staff_no
ORDER BY restBill.bill_total DESC;

-- 5

SELECT first_name, surname
FROM restStaff
WHERE headwaiter = 
    (SELECT restStaff.headwaiter
    FROM restStaff
    INNER JOIN restBill ON restBill.waiter_no = restStaff.staff_no
    WHERE restBill.bill_no = "00017")
OR headwaiter =
    (SELECT restStaff.headwaiter
    FROM restStaff
    INNER JOIN restBill ON restBill.waiter_no = restStaff.staff_no
    WHERE restBill.bill_no = "00014");

-- 6

SELECT first_name, surname
FROM restStaff
WHERE headwaiter = 
    (SELECT Management.headwaiter
    FROM restStaff Staff
    LEFT JOIN restRoom_management Management
    ON Staff.staff_no = Management.headwaiter
    WHERE Management.room_name = "Blue"
    AND Management.room_date = "160312")
OR staff_no = 
    (SELECT Management.headwaiter
    FROM restStaff Staff
    LEFT JOIN restRoom_management Management
    ON Staff.staff_no = Management.headwaiter
    WHERE Management.room_name = "Blue"
    AND Management.room_date = "160312");