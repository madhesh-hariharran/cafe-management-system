use Cafe_Management_System;

-- 1. Retrieve the names of all employees in the 'Waiter' position.
SELECT F_NAME, L_NAME
FROM EMPLOYEE
WHERE POSITION = 'Waiter';

-- 2. Find all the shifts that are scheduled on 'Monday'.
SELECT *
FROM SCHEDULE
WHERE DAY = 'Monday';

-- 3. List all the sales invoices with amounts greater than 1000.
SELECT *
FROM SALES
WHERE AMOUNT > 1000;

-- 4. Calculate the total quantity of each item in the inventory.
SELECT ITEM_DESC, SUM(QUANTITY) AS TotalQuantity
FROM INVENTORY
GROUP BY ITEM_DESC;

-- 5. Get the details of employees who have taken leave between '2024-01-01' and '2024-01-31'.
SELECT EMP_ID, LEAVE_START, LEAVE_END
FROM LEAVE_DETAILS
WHERE LEAVE_START >= '2024-01-01' AND LEAVE_END <= '2024-01-31';

-- 6. List all vacant positions in 'Café Unit 1'.
SELECT *
FROM VACANCY
WHERE UNIT_ID = (SELECT UNIT_ID FROM UNIT WHERE UNIT_NAME = 'Café Unit 1');

-- 7. Display the number of hours each shift lasts.
SELECT SHIFT_ID, (SHIFT_END - SHIFT_START) AS Duration
FROM SHIFT;

-- 8. Find all employees who work under supervisor with SUP_EMP_ID = 101.
SELECT EMP_ID, F_NAME, L_NAME
FROM EMPLOYEE
WHERE EMP_ID IN (SELECT EMP_ID FROM UNIT WHERE SUP_EMP_ID = 101);

-- 9. Fetch the details of the inventory items purchased on '2024-07-01'.
SELECT *
FROM INVENTORY
WHERE DATE = '2024-07-01';

-- 10. Display all employees working in 'Café Unit 2'.
SELECT EMP_ID, F_NAME, L_NAME
FROM EMPLOYEE
WHERE EMP_ID IN (SELECT EMP_ID FROM UNIT WHERE UNIT_NAME = 'Café Unit 2');

-- 11. Find the details of the item with the highest quantity in the inventory.
SELECT ITEM_DESC, MAX(QUANTITY) AS MaxQuantity
FROM INVENTORY;

-- 12. List the names of all employees who have applied for leave.
SELECT F_NAME, L_NAME
FROM EMPLOYEE
WHERE EMP_ID IN (SELECT EMP_ID FROM LEAVE_DETAILS);

-- 13. Retrieve the details of employees who have been hired after '2023-06-01'.
SELECT EMP_ID, F_NAME, L_NAME, JOIN_DATE
FROM EMPLOYEE
WHERE JOIN_DATE > '2023-06-01';

-- 14. Get the details of sales invoices with the item description containing 'Coffee'.
SELECT *
FROM SALES
WHERE ITEM_DESC LIKE '%Coffee%';

-- 15. Count the number of employees in each position.
SELECT POSITION, COUNT(*) AS NumEmployees
FROM EMPLOYEE
GROUP BY POSITION;

-- 16. Retrieve the total amount of sales made in '2023'.
SELECT SUM(AMOUNT) AS TotalSales2023
FROM SALES
WHERE YEAR(DATE) = 2023;

-- 17. Display the shift schedule for 'Employee ID 102'.
SELECT *
FROM SCHEDULE
WHERE EMP_ID = 102;

-- 18. List all the inventory items that need to be restocked (quantity less than 50).
SELECT ITEM_DESC, QUANTITY
FROM INVENTORY
WHERE QUANTITY < 50;

-- 19. Retrieve the details of all employees who work in the 'Kitchen' department.
SELECT *
FROM EMPLOYEE
WHERE DEPT = 'Kitchen';

-- 20. Find the details of the supervisor who has the most employees under them.
SELECT SUP_EMP_ID, COUNT(EMP_ID) AS NumEmployees
FROM UNIT
GROUP BY SUP_EMP_ID
ORDER BY NumEmployees DESC
LIMIT 1;

-- 21. Display the employee names and their respective units.
SELECT EMPLOYEE.F_NAME, EMPLOYEE.L_NAME, UNIT.UNIT_NAME
FROM EMPLOYEE
JOIN UNIT ON EMPLOYEE.UNIT_ID = UNIT.UNIT_ID;

-- 22. List the details of all shifts that start after 12:00 PM.
SELECT *
FROM SHIFT
WHERE SHIFT_START > '12:00';

-- 23. Get the total number of leave days taken by 'Employee ID 104'.
SELECT EMP_ID, SUM(DATEDIFF(LEAVE_END, LEAVE_START) + 1) AS TotalLeaveDays
FROM LEAVE_DETAILS
WHERE EMP_ID = 104;

-- 24. Retrieve the details of all sales invoices for the month of 'July 2024'.
SELECT *
FROM SALES
WHERE MONTH(DATE) = 7 AND YEAR(DATE) = 2024;

-- 25. Find the average quantity of items in the inventory.
SELECT AVG(QUANTITY) AS AvgQuantity
FROM INVENTORY;

-- 26. Display the total number of hours worked by each employee.
SELECT EMP_ID, SUM(DATEDIFF(SHIFT_END, SHIFT_START)) AS TotalHoursWorked
FROM SHIFT
GROUP BY EMP_ID;

-- 27. Retrieve the details of employees whose names start with 'A'.
SELECT *
FROM EMPLOYEE
WHERE F_NAME LIKE 'A%';

-- 28. Get the details of all items purchased from supplier with SUPPLIER_ID = 2002.
SELECT *
FROM INVENTORY
WHERE SUPPLIER_ID = 2002;

-- 29. List the details of all employees who have been assigned to 'Café Unit 3'.
SELECT *
FROM EMPLOYEE
WHERE UNIT_ID = (SELECT UNIT_ID FROM UNIT WHERE UNIT_NAME = 'Café Unit 3');

-- 30. Find the total amount of sales made for 'Espresso' in '2024'.
SELECT SUM(AMOUNT) AS TotalEspressoSales
FROM SALES
WHERE ITEM_DESC = 'Espresso' AND YEAR(DATE) = 2024;

-- 31. Display the details of all shifts that last more than 8 hours.
SELECT *
FROM SHIFT
WHERE (SHIFT_END - SHIFT_START) > 8;

-- 32. Retrieve the employee IDs and names of all employees who have not taken any leave.
SELECT EMP_ID, F_NAME, L_NAME
FROM EMPLOYEE
WHERE EMP_ID NOT IN (SELECT EMP_ID FROM LEAVE_DETAILS);

-- 33. Get the details of all sales invoices made by 'Employee ID 105'.
SELECT *
FROM SALES
WHERE EMP_ID = 105;

-- 34. List all the suppliers who have provided items to the inventory.
SELECT DISTINCT SUPPLIER_ID
FROM INVENTORY;

-- 35. Display the details of all employees who work more than 40 hours a week.
SELECT EMP_ID, SUM(DATEDIFF(SHIFT_END, SHIFT_START)) AS TotalHoursWorked
FROM SHIFT
GROUP BY EMP_ID
HAVING TotalHoursWorked > 40;

-- 36. Retrieve the details of the item with the lowest quantity in the inventory.
SELECT ITEM_DESC, MIN(QUANTITY) AS MinQuantity
FROM INVENTORY;

-- 37. Find the details of all employees who have been promoted since '2023-01-01'.
SELECT *
FROM EMPLOYEE
WHERE PROMOTION_DATE > '2023-01-01';

-- 38. Display the employee names and the total sales amount they have generated.
SELECT EMPLOYEE.F_NAME, EMPLOYEE.L_NAME, SUM(SALES.AMOUNT) AS TotalSales
FROM EMPLOYEE
JOIN SALES ON EMPLOYEE.EMP_ID = SALES.EMP_ID
GROUP BY EMPLOYEE.EMP_ID;

-- 39. List the details of all items that were last restocked on '2024-06-30'.
SELECT *
FROM INVENTORY
WHERE LAST_RESTOCK_DATE = '2024-06-30';

-- 40. Retrieve the details of all shifts scheduled between '2024-08-01' and '2024-08-31'.
SELECT *
FROM SHIFT
WHERE SHIFT_DATE BETWEEN '2024-08-01' AND '2024-08-31';
