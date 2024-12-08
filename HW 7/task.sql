-- 1

CREATE OR REPLACE VIEW samsBills
AS SELECT restStaff.first_name, restStaff.surname, restBill.bill_date, restBill.cust_name, restBill.bill_total
FROM restStaff
JOIN restBill
ON restStaff.staff_no = restBill.waiter_no
WHERE restStaff.first_name = "Sam"
AND restStaff.surname = "Pitt";

-- 2

SELECT *
FROM samsBills
WHERE bill_total > 400;

-- 3

CREATE OR REPLACE VIEW roomTotals
AS SELECT restRest_table.room_name, SUM(restBill.bill_total) AS total_sum
FROM restRest_table
JOIN restBill
ON restRest_table.table_no = restBill.table_no
GROUP BY restRest_table.room_name;

-- 4

CREATE OR REPLACE VIEW teamTotals
AS SELECT CONCAT(rs1.first_name, ' ', rs1.surname) AS headwaiter_name, SUM(restBill.bill_total) AS total_sum
FROM restStaff rs1
JOIN restStaff rs2
ON rs1.staff_no = rs2.headwaiter
JOIN restBill
ON rs2.staff_no = restBill.waiter_no
GROUP BY rs1.first_name, rs1.surname, rs1.staff_no
ORDER BY total_sum DESC;