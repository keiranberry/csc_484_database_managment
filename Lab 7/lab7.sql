use dreamhome;

-- task 1
DELIMITER $$
DROP PROCEDURE IF EXISTS HelloWorld$$
CREATE PROCEDURE HelloWorld()
BEGIN
SELECT 'Hello World';
END$$
-- Run
call HelloWorld();

-- task 2
DELIMITER //
DROP PROCEDURE IF EXISTS example2//
CREATE PROCEDURE example2(input_number INT)
BEGIN
 DECLARE l_sqrt FLOAT;
 SET l_sqrt = SQRT(input_number);
 SELECT l_sqrt;
END//
-- Run
call example2(12);

-- task 3
DELIMITER $$
DROP PROCEDURE IF EXISTS example3$$
CREATE PROCEDURE example3(input_number INT, OUT out_number FLOAT)
BEGIN
 SET out_number = SQRT(input_number);
END$$
-- Run
set @out_number = 0;
call example3(12, @out_number);
select @out_number;

-- task 4
DELIMITER $$
DROP PROCEDURE IF EXISTS example4$$
CREATE PROCEDURE example4(normal_price NUMERIC(8,2),
 OUT discount_price NUMERIC(8,2))
BEGIN
IF (normal_price > 500) THEN
SET discount_price = normal_price * .8;
ELSEIF(normal_price > 100) THEN
SET discount_price = normal_price * .9;
ELSE
SET discount_price = normal_price;
END IF;
END$$
-- Run
set @discount_price = 0;
call example4(556, @discount_price);
select @discount_price;

-- task 5
DELIMITER $$
DROP PROCEDURE IF EXISTS example4$$
CREATE PROCEDURE example4(normal_price NUMERIC(8,2),
 OUT discount_price NUMERIC(8,2))
BEGIN
  SET discount_price = CASE
    WHEN normal_price > 500 THEN normal_price * 0.8
    WHEN normal_price > 100 THEN normal_price * 0.9
    ELSE normal_price
  END;
END$$
-- Run
set @discount_price = 0;
call example4(556, @discount_price);
select @discount_price;

-- task 6
DELIMITER $$
DROP PROCEDURE IF EXISTS my_multiplier$$
CREATE PROCEDURE my_multiplier(IN number_one INT, IN number_two INT,
 OUT final_number INT)
BEGIN
  SET final_number = number_one * number_two;
END$$
-- Run
set @final_number = 0;
call my_multiplier(2, 4, @final_number);
select @final_number;

set @final_number = 0;
call my_multiplier(12, 12, @final_number);
select @final_number;

set @final_number = 0;
call my_multiplier(2, 1200, @final_number);
select @final_number;

-- task 7
DELIMITER $$
DROP PROCEDURE IF EXISTS GetStaffInBranch$$
CREATE PROCEDURE GetStaffInBranch(IN branchNumber varchar(100))
BEGIN
  select * from staff where branchNo = branchNumber;
END$$
-- Run
call GetStaffInBranch('B003');

-- task 8
DELIMITER $$
DROP PROCEDURE IF EXISTS TotalSalaryByBranch$$
CREATE PROCEDURE TotalSalaryByBranch(IN branchNumber varchar(100), OUT totalSalary INT)
BEGIN
  select sum(salary) into totalSalary from staff where branchNo = branchNumber;
END$$
-- Run

-- Run
SET @totalSalary = 0;
CALL TotalSalaryByBranch('B003', @totalSalary);
SELECT @totalSalary;