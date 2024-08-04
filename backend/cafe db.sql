
create database Cafe_Management_System;
use Cafe_Management_System;
-- Creating the CATEGORY table with CATEGORY_ID as the primary key
CREATE TABLE CATEGORY (
    CATEGORY_ID INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    CATEGORY_NAME VARCHAR(20)
);

-- Creating the SHIFT_ table with SHIFT_ID as the primary key and foreign key references to CATEGORY table
CREATE TABLE SHIFT_ (
    SHIFT_ID INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    SHIFT_START TIME,
    SHIFT_END TIME,
    UNIT_ID INT NOT NULL,
    CATEGORY_ID INT NOT NULL,
    NUMBER_OF_HOURS INT,
    FOREIGN KEY (CATEGORY_ID) REFERENCES CATEGORY (CATEGORY_ID)
);

-- Creating the UNIT table with UNIT_ID as the primary key and foreign key reference to EMPLOYEE table
CREATE TABLE UNIT (
    UNIT_ID INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    UNIT_NAME VARCHAR(20),
    UNIT_LOCATION VARCHAR(20),
    SUP_EMP_ID INT NOT NULL,
    FOREIGN KEY (SUP_EMP_ID) REFERENCES EMPLOYEE (EMP_ID)
);

-- Creating the SCHEDULE table with foreign key references to EMPLOYEE and SHIFT_ tables
CREATE TABLE SCHEDULE (
    EMP_ID INT NOT NULL,
    DAY_ VARCHAR(3),
    SHIFT_ID INT NOT NULL,
    FOREIGN KEY (EMP_ID) REFERENCES EMPLOYEE (EMP_ID),
    FOREIGN KEY (SHIFT_ID) REFERENCES SHIFT_ (SHIFT_ID)
);

-- Creating the LEAVE_DETAILS table with LEAVE_ID as the primary key and foreign key references to EMPLOYEE table
CREATE TABLE LEAVE_DETAILS (
    LEAVE_ID INT AUTO_INCREMENT PRIMARY KEY,
    EMP_ID INT NOT NULL,
    LEAVE_START DATETIME,
    LEAVE_END DATETIME,
    REPLACEMENT_FOUND VARCHAR(1) CHECK (REPLACEMENT_FOUND IN ('Y', 'N')),
    FOREIGN KEY (EMP_ID) REFERENCES EMPLOYEE (EMP_ID)
);

-- Creating the INVENTORY table with ITEM_ID as the primary key and foreign key references to UNIT table
CREATE TABLE INVENTORY (
    ITEM_ID INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    ITEM_DESC VARCHAR(20),
    DATE_ DATETIME,
    UNIT_ID INT NOT NULL,
    COST_PER_UNIT DECIMAL(10, 2),
    QUANTITY INT,
    FOREIGN KEY (UNIT_ID) REFERENCES UNIT (UNIT_ID)
);

-- Creating the SALES table with INVOICE_NUMBER as the primary key and foreign key references to UNIT table
CREATE TABLE SALES (
    INVOICE_NUMBER INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    INVOICE_DATE DATETIME,
    AMOUNT DECIMAL(10, 2) NOT NULL,
    UNIT_ID INT NOT NULL,
    FOREIGN KEY (UNIT_ID) REFERENCES UNIT(UNIT_ID)
);

-- Creating the VACANCY table with VACANCY_ID as the primary key and foreign key references to SHIFT_, CATEGORY, and UNIT tables
CREATE TABLE VACANCY (
    VACANCY_ID INT AUTO_INCREMENT PRIMARY KEY,
    SHIFT_ID INT NOT NULL,
    CATEGORY_ID INT NOT NULL,
    UNIT_ID INT NOT NULL,
    FOREIGN KEY (SHIFT_ID) REFERENCES SHIFT_ (SHIFT_ID),
    FOREIGN KEY (CATEGORY_ID) REFERENCES CATEGORY (CATEGORY_ID),
    FOREIGN KEY (UNIT_ID) REFERENCES UNIT (UNIT_ID)
);

-- Inserting data into the EMPLOYEE table
INSERT INTO EMPLOYEE(EMP_ID, F_NAME, L_NAME, POSITION, PHONE_NUMBER, GENDER)
VALUES 
(1, 'Chirag','Bilimoria', 'Supervisor', '405-614-9950', 'M'),
(2, 'Akshay', 'Arora', 'Hot Food', '405-614-9951', 'M'),
(3, 'Ankit','Singh', 'Supervisor', '405-614-9952', 'M'),
(4, 'Mudassir', 'Ahmad', 'Cashier', '405-614-9953', 'M'),
(5, 'Adithya','Popuri', 'Stocker', '405-614-9954', 'M'),
(6, 'Gaurav', 'Khatri', 'Cashier', '405-614-9955', 'M'),
(7, 'Kartik', 'Josyula', 'Stocker', '405-614-9956', 'M'),
(8, 'Sophia', 'Dsouza', 'Coffee', '405-614-9957', 'F'),
(9, 'Kinsey', 'McCool', 'Hot Food', '405-614-9958', 'F'),
(10, 'Bijoy', 'Thomas', 'Cashier', '405-614-9957', 'M'),
(11, 'Devika', 'Kale', 'Cashier', '405-614-9960', 'F'),
(12, 'Ishan', 'Malpotra', 'Hot Food', '405-614-9961', 'M'),
(13, 'Aman', 'Tayal', 'Coffee', '485-614-9962', 'M'),
(14, 'Prachiti', 'Garg', 'Stocker', '405-614-9963', 'F'),
(15, 'Adrian', 'Lee', 'Stocker', '405-614-9964', 'F'),
(16, 'Grace', 'Bowman', 'Hot Food', '405-614-9965', 'F'),
(17, 'Steph', 'Curry', 'Coffee', '405-614-9966', 'M'),
(18, 'Lauren', 'Phillips', 'Coffee', '405-614-9967', 'F'),
(19, 'Brett', 'Hart', 'Coffee', '405-614-9968', 'M'),
(20, 'Paige', 'Jackson', 'Hot Food', '405-614-9969', 'F');

-- Inserting data into the CATEGORY table
INSERT INTO CATEGORY (CATEGORY_ID, CATEGORY_NAME)
VALUES 
(1,'SUPERVISOR'), 
(2,'CASHIER'), 
(3,'COFFEE'), 
(4,'STOCKER'), 
(5,'HOT FOOD');

-- Inserting data into the SHIFT_ table
INSERT INTO SHIFT_(SHIFT_START, SHIFT_END, UNIT_ID, CATEGORY_ID, NUMBER_OF_HOURS) 
VALUES 
('07:00:00','11:00:00', 1, 2, 4),
('11:00:00','15:00:00', 1, 2, 4), 
('07:00:00','11:00:00', 1, 4, 4),
('11:00:00','15:00:00', 1, 4, 4),
('07:00:00','11:00:00', 1, 3, 4),
('11:00:00','15:00:00', 1, 3, 4),
('07:00:00','11:00:00', 1, 5, 4),
('11:00:00','15:00:00', 1, 5, 4), 
('07:00:00','11:00:00', 2, 2, 4),
('11:00:00','15:00:00', 2, 2, 4),
('07:00:00','11:00:00', 2, 4, 4),
('11:00:00','15:00:00', 2, 4, 4),
('07:00:00','11:00:00', 2, 3, 4),
('11:00:00', '15:00:00', 2, 3, 4), 
('07:00:00','11:00:00', 2, 5, 4),
('11:00:00','15:00:00', 2, 5, 4),
('07:00:00', '15:00:00', 1, 1, 8), 
('07:00:00','15:00:00', 2, 1, 8),
('07:00:00','11:00:00', 1, 2, 4),
('11:00:00','15:00:00', 1, 3, 4), 
('07:00:00','11:00:00', 2, 4, 4),
('11:00:00','15:00:00', 2, 5, 4);

-- Inserting data into the UNIT table
INSERT INTO UNIT(UNIT_NAME, UNIT_LOCATION, SUP_EMP_ID)
VALUES 
('Cafe Libro','Library','1'),
('Fast Break', 'Bennett Hall','3');

-- Adding additional columns to the EMPLOYEE table
ALTER TABLE EMPLOYEE ADD COLUMN EMAIL_ID VARCHAR(50);
ALTER TABLE EMPLOYEE ADD COLUMN JOIN_DATE DATE;
ALTER TABLE EMPLOYEE ADD COLUMN ADDRESS VARCHAR(100);
ALTER TABLE EMPLOYEE ADD COLUMN UNIT_ID INT;
ALTER TABLE EMPLOYEE ADD COLUMN CATEGORY_ID INT;
ALTER TABLE EMPLOYEE ADD COLUMN SHIFT_ID INT;
ALTER TABLE EMPLOYEE ADD COLUMN QUALIFICATION VARCHAR(10);
ALTER TABLE EMPLOYEE ADD COLUMN RATING DECIMAL(2,1);
ALTER TABLE EMPLOYEE ADD COLUMN SALARY DECIMAL(10, 2);

-- Creating the PHN_NO table to store additional phone numbers for employees
CREATE TABLE PHN_NO(
    EMP_ID INT NOT NULL,
    PHONE_NUMBER VARCHAR(50) NOT NULL,
    FOREIGN KEY (EMP_ID) REFERENCES EMPLOYEE(EMP_ID)
);

-- Inserting data into the PHN_NO table
INSERT INTO PHN_NO (EMP_ID, PHONE_NUMBER)
VALUES
(1, '405-614-9970'),
(2, '405-614-9971'),
(3, '405-614-9972'),
(4, '405-614-9973'),
(5, '405-614-9974'),
(6, '405-614-9975'),
(7, '405-614-9976'),
(8, '405-614-9977'),
(9, '405-614-9978'),
(10, '405-614-9979');

-- Creating the OVER_TIME table to track overtime records
CREATE TABLE OVER_TIME (
    EMP_ID INT NOT NULL,
    OVER_TIME_HOURS DECIMAL(4, 2),
    SHIFT_ID INT NOT NULL,
    FOREIGN KEY (EMP_ID) REFERENCES EMPLOYEE(EMP_ID),
    FOREIGN KEY (SHIFT_ID) REFERENCES SHIFT_(SHIFT_ID)
);

-- Inserting data into the OVER_TIME table
INSERT INTO OVER_TIME(EMP_ID, OVER_TIME_HOURS, SHIFT_ID)
VALUES
(1, 2.00, 1),
(2, 3.00, 2),
(3, 1.00, 3),
(4, 4.00, 4),
(5, 5.00, 5);

