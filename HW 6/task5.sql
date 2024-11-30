-- 1

SELECT restStaff.first_name, restStaff.surname, restBill.bill_date, COUNT(restBill.bill_no) AS bill_count
FROM restBill
INNER JOIN restStaff
ON restBill.waiter_no = restStaff.staff_no
GROUP BY restBill.bill_date, restStaff.first_name, restStaff.surname
HAVING COUNT(restBill.bill_no) >= 2;

-- 2

SELECT restRest_table.room_name, COUNT(restRest_table.room_name) AS room
FROM restRest_table
WHERE restRest_table.no_of_seats > 6
GROUP BY restRest_table.room_name;

-- 3

SELECT restRest_table.room_name, COUNT(restBill.table_no) AS no_of_bills
FROM restRest_table
INNER JOIN restBill
ON restRest_table.table_no = restBill.table_no
GROUP BY restRest_table.room_name;

-- 4

SELECT rs1.first_name, rs1.surname, SUM(restBill.bill_total) AS total_bill
FROM restStaff rs1
JOIN restStaff rs2
ON rs1.staff_no = rs2.headwaiter
JOIN restBill
ON rs2.staff_no = restBill.waiter_no
GROUP BY rs1.first_name, rs1.surname, rs1.staff_no;
ORDER BY total_bill DESC;

-- 5

SELECT cust_name, AVG(bill_total) AS average_bill
FROM restBill
GROUP BY cust_name
HAVING AVG(bill_total) > 400;

-- 6

SELECT restStaff.first_name, restStaff.surname, restBill.bill_date, COUNT(restBill.bill_no) AS bill_count
FROM restBill
INNER JOIN restStaff
ON restBill.waiter_no = restStaff.staff_no
GROUP BY restBill.bill_date, restStaff.first_name, restStaff.surname
HAVING COUNT(restBill.bill_no) >= 3;