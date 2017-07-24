#Use esta query para sacar el max address

SELECT MAX(address_id)
FROM address
INNER JOIN city USING(city_id)
INNER JOIN country USING(country_id)
WHERE country = "United States";

INSERT INTO sakila.customer
(store_id, first_name, last_name, email, address_id, active, create_date, last_update)
VALUES(1, 'Ivan', 'Aradas', 'aa@gmail.com', 599, 1, '2017-05-29 14:20:36', CURRENT_TIMESTAMP);



#Use esta query para sacar el max inventory_id de la film title ACADEMY DINOSAUR
SELECT MAX(inventory_id)
FROM film
INNER JOIN inventory USING(film_id)
WHERE title =  'CHILL LUCK';


#use esta query para sacar el staff id de la store id 2
SELECT staff_id
FROM staff
WHERE store_id = 2;

INSERT INTO sakila.rental
(inventory_id, customer_id, return_date, staff_id, last_update)
VALUES(8, 2, CURRENT_TIMESTAMP, 2, CURRENT_TIMESTAMP);


-- 3
UPDATE film
SET film.release_year = 2001
WHERE film.rating = "G";

UPDATE film
SET film.release_year = 2010
WHERE film.rating = "PG";

UPDATE film
SET film.release_year = 2004
WHERE film.rating = "R";

UPDATE film
SET film.release_year = 2011
WHERE film.rating = "PG-13";

UPDATE film
SET film.release_year = 2015
WHERE film.rating = "NC-17";

SELECT film.rating, film.release_year
FROM film
WHERE film.rating = 'NC-17';


SELECT rental.rental_id
FROM rental
WHERE return_date = NULL;


