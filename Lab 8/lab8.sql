-- task 1
DELIMITER $$
DROP PROCEDURE IF EXISTS simple_loop$$
drop temporary table if exists log$$
  create temporary table log (val INT)$$
CREATE PROCEDURE simple_loop()
BEGIN
 DECLARE counter INT DEFAULT 0;
 my_simple_loop: LOOP
SET counter = counter + 1;
insert into log values (counter);
IF counter = 10 THEN
 LEAVE my_simple_loop;
END IF;
 END LOOP my_simple_loop;
 select * from log;
END$$
call simple_loop();

-- task 2
DELIMITER $$
DROP PROCEDURE IF EXISTS FahrenheitToCelsius$$
CREATE PROCEDURE FahrenheitToCelsius(input float)
BEGIN
 DECLARE finalTemp float;
 declare numOne float;
 declare numTwo float;
 set numOne = 100.0/180.0;
 set numTwo = (input - 32);
 set finalTemp = numOne*numTwo;
 select finalTemp;
END$$
call FahrenheitToCelsius(32);
call FahrenheitToCelsius(98.6);
call FahrenheitToCelsius(104);
call FahrenheitToCelsius(212);

-- task 3
DELIMITER $$
DROP PROCEDURE IF EXISTS sum_digits$$
CREATE PROCEDURE sum_digits(input int)
BEGIN
	DECLARE sum INT default 0;
    DECLARE digit INT;
    
    WHILE input > 0 DO
        SET digit = MOD(input, 10);
        SET sum = sum + digit;
        SET input = FLOOR(input / 10);
    END WHILE;

    SELECT sum;
END$$
call sum_digits(36);
call sum_digits(378);
call sum_digits(2784);

-- task 4
DELIMITER $$
DROP PROCEDURE IF EXISTS reverseDigit$$
CREATE PROCEDURE reverseDigit(input INT)
BEGIN
    DECLARE reversed INT DEFAULT 0;
    DECLARE digit INT;

    WHILE input > 0 DO
        SET digit = MOD(input, 10);
        SET reversed = reversed * 10 + digit;
        SET input = FLOOR(input / 10);
    END WHILE;

    SELECT reversed;
END$$

call reverseDigit(378);
call reverseDigit(3784);
call reverseDigit(37866);

-- task 5
DELIMITER $$
DROP PROCEDURE IF EXISTS factorial$$
CREATE PROCEDURE factorial(input INT)
BEGIN
    DECLARE currentNum INT;
    DECLARE nextNum INT;
    SET currentNum = input;
    SET nextNum = currentNum - 1;

    WHILE nextNum > 0 DO
        SET currentNum = currentNum * nextNum;
        SET nextNum = nextNum - 1;
    END WHILE;

    SELECT currentNum;
END$$

call factorial(0);
call factorial(1);
call factorial(6);

-- task 6
DELIMITER $$
DROP PROCEDURE IF EXISTS fibonacci_sequence$$
CREATE PROCEDURE fibonacci_sequence(input INT)
BEGIN
    DECLARE lastNum INT DEFAULT 1;
    DECLARE secondLastNum INT DEFAULT 0;
    DECLARE currentNum INT DEFAULT 0;
    DECLARE counter INT DEFAULT 0;
    drop temporary table if exists log;
	create temporary table log (val INT);

    WHILE counter < input DO
        IF counter = 0 THEN
            SET currentNum = 0;
        ELSEIF counter = 1 THEN
            SET currentNum = 1;
        ELSE
            SET currentNum = lastNum + secondLastNum;
        END IF;

        INSERT INTO log VALUES (currentNum);
        SET secondLastNum = lastNum;
        SET lastNum = currentNum;
        SET counter = counter + 1;
    END WHILE;

    SELECT * FROM log;
END$$

CALL fibonacci_sequence(6);
CALL fibonacci_sequence(10);

-- task 7
DELIMITER $$
DROP PROCEDURE IF EXISTS is_palindrome$$
CREATE PROCEDURE is_palindrome(IN input INT, OUT output varchar(100))
BEGIN
    DECLARE reversed INT DEFAULT 0;
    DECLARE digit INT;
    DECLARE original INT;
    SET original = input;

    WHILE input > 0 DO
        SET digit = MOD(input, 10);
        SET reversed = reversed * 10 + digit;
        SET input = FLOOR(input / 10);
    END WHILE;

    IF reversed = original THEN
		SET output = 'Yes';
	ELSE 
		SET output = 'No';
	END IF;
END$$

SET @result = '';
CALL is_palindrome(121, @result);
SELECT @result;
CALL is_palindrome(123, @result);
SELECT @result;
CALL is_palindrome(1441, @result);
SELECT @result;