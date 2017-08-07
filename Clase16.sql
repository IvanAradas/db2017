CREATE TABLE `employees` (
  `employeeNumber` int(11) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `extension` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `officeCode` varchar(10) NOT NULL,
  `reportsTo` int(11) DEFAULT NULL,
  `jobTitle` varchar(50) NOT NULL,
  PRIMARY KEY (`employeeNumber`)
);

insert  into `employees`(`employeeNumber`,`lastName`,`firstName`,`extension`,`email`,`officeCode`,`reportsTo`,`jobTitle`) values 
(1002,'Murphy','Diane','x5800','dmurphy@classicmodelcars.com','1',NULL,'President'),
(1056,'Patterson','Mary','x4611','mpatterso@classicmodelcars.com','1',1002,'VP Sales'),
(1076,'Firrelli','Jeff','x9273','jfirrelli@classicmodelcars.com','1',1002,'VP Marketing');

CREATE TABLE employees_audit (
    id INT AUTO_INCREMENT PRIMARY KEY,
    employeeNumber INT NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    changedat DATETIME DEFAULT NULL,
    action VARCHAR(50) DEFAULT NULL
);


DELIMITER $$
CREATE TRIGGER before_employee_update 
    BEFORE UPDATE ON employees
    FOR EACH ROW 
BEGIN
    INSERT INTO employees_audit
    SET action = 'update',
     employeeNumber = OLD.employeeNumber,
        lastname = OLD.lastname,
        changedat = NOW(); 
END$$
DELIMITER ;

UPDATE employees 
SET 
    lastName = 'Phan'
WHERE
    employeeNumber = 1056;
    
SELECT 
    *
FROM
    employees_audit;
    
-- 1

insert  into `employees`(`employeeNumber`,`lastName`,`firstName`,`extension`,`email`,`officeCode`,`reportsTo`,`jobTitle`) values 
(1002,'aaaras','Ivan','x1234',NULL,'1',NULL,'ceo');

-- Alert: el campo email no puede ser nulo y no realiza el insert
    
    
-- 2 
UPDATE employees set employeeNumber = employeeNumber - 20

-- Actualiza la tabla employees y le suma 20 al employeedNumber de cada empleado. 

SELECT * FROM employees;
 
-- /////////////////////

UPDATE employees set employeeNumber = employeeNumber + 20

-- Intenta actualizar la tabla employees, y al querer restarle 20 al employeeNumber, tira error porque el elmployeedNumber esta dublicado.

-- 3 

ALTER TABLE employees ADD AGE INT;
ALTER TABLE employees
	ADD CONSTRAINT myCheckConstraint CHECK(AGE >= 18 AND AGE <=70);

-- 5 
-- Create a new column called lastUpdate to table employee and use trigger(s) to keep the date-time updated on inserts and updates operations. 
-- Bonus: add a column lastUpdateUser and the respective trigger(s) to specify who was the last MySQL user that changed the row 
-- (assume multiple users, other than root, can connect to MySQL and change this table).

ALTER TABLE employees ADD lastUpdate DATETIME DEFAULT NULL;

DELIMITER $$
CREATE TRIGGER employee_lastUpdate 
    BEFORE UPDATE ON employees
    FOR EACH ROW 
BEGIN
    INSERT INTO employees_audit
    SET action = 'update',
     employeeNumber = OLD.employeeNumber,
        lastUpdate = NOW(); 
END$$
DELIMITER ;

	

