CALL get_order_by_cust(141,@shipped,@canceled,@resolved,@disputed); 

SELECT @shipped,@canceled,@resolved,@disputed;

DESCRIBE customers;

SET @customerNo = 112;

SELECT country into @country
FROM customers
WHERE customernumber = @customerNo;

CALL GetCustomerShipping(@customerNo,@shipping);

SELECT @customerNo AS Customer,
       @country    AS Country,
       @shipping   AS Shipping;
       
-- 2

CALL test_mysql_loop();

SET @email_list = "";
CALL build_email_list(@email_list);
SELECT @email_list;

-- Exercises

-- 1

SELECT COUNT(*) 
FROM film
INNER JOIN inventory USING(film_id)
INNER JOIN store USING(store_id)
WHERE store_id = 2
AND title LIKE 'ACADEMY DINOSAUR';

-- function
CREATE FUNCTION TitleStoreCount(p_idfilm INT, p_store INT, p_title VARCHAR(35))
    RETURNS INTEGER
   DETERMINISTIC
 BEGIN
	DECLARE storeTotal INT;
	SET storeTotal = (SELECT COUNT(*) 
	FROM film
	INNER JOIN inventory USING(film_id)
	INNER JOIN store USING(store_id)
	WHERE store_id = p_store
	AND title = p_title)
	
	RETURN (storeTotal)
END;
-- end function

SELECT TitleStoreCount(1,2,'ACADEMY DINOSAUR');

-- 2 -Write a stored procedure that returns a list of customer first and last names separated by ";", that live in a certain country. 
--     You pass the country it gives you the list of people living there.

SELECT GROUP_CONCAT(customer.first_name, ' ' ,customer.last_name SEPARATOR ';') 
FROM customer
INNER JOIN address USING(address_id)
INNER JOIN city USING(city_id)
INNER JOIN country USING(country_id)
WHERE country = 'Argentina';

-- PROCEDURE
DELIMITER $$
CREATE PROCEDURE PeopleCountryList(
        IN p_country VARCHAR(25),
        OUT listPeople TEXT)
BEGIN
	SELECT GROUP_CONCAT(customer.first_name, ' ' ,customer.last_name SEPARATOR ';') INTO listPeople
	FROM customer
	INNER JOIN address USING(address_id)
	INNER JOIN city USING(city_id)
	INNER JOIN country USING(country_id)
	WHERE country = p_country;
END$$
DELIMITER ;

CALL PeopleCountryList('Argentina',@listPeople);
SELECT @listPeople;

-- CON CURSOR

CREATE DEFINER=`root`@`localhost` PROCEDURE `sakila`.`CountryList`(
        IN p_country VARCHAR(25),
        INOUT listPeople TEXT)
BEGIN
	
    DECLARE v_finished INTEGER DEFAULT 0;
    DECLARE v_fn varchar(100) DEFAULT "";
    DECLARE v_ln varchar(100) DEFAULT "";
    
    
        DECLARE country_cursor CURSOR FOR
        SELECT customer.first_name, customer.last_name
        FROM customer
		INNER JOIN address USING(address_id)
		INNER JOIN city USING(city_id)
		INNER JOIN country USING(country_id)
		WHERE country = p_country;
		
		DECLARE CONTINUE HANDLER 
        FOR NOT FOUND SET v_finished = 1;
        
        OPEN country_cursor;
        
        get_country: LOOP
        
        FETCH country_cursor INTO v_fn, v_ln;
        	    	
        IF v_finished = 1 THEN 
            LEAVE get_country;
        END IF;
        
        SET listPeople = CONCAT(v_fn,' ' , v_ln,";",listPeople);
        
        END LOOP get_country;
        CLOSE country_cursor;
        
END



SET @listPeople = "";
CALL CountryList('Argentina',@listPeople);
SELECT @listPeople;

