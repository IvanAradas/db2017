-- 1
SELECT CONCAT_WS(' ',first_name,last_name), address.address,city.city
FROM customer
INNER JOIN address USING(address_id)
INNER JOIN city USING(city_id)
INNER JOIN country USING(country_id)
WHERE country.country = 'Argentina';

-- 2
SELECT title,`language`.name, CASE rating WHEN 'G' THEN 'General Audiences'
										WHEN 'PG' THEN 'Parental Guidance Suggested'
										WHEN 'PG-13' THEN 'Parents Strongly Cautioned'
										WHEN 'R' THEN 'Restricted'
										WHEN 'NC-17' THEN 'Adults Only'
										ELSE 'HOLAAA' END AS 'rating'
FROM film
INNER JOIN `language` USING(language_id);

-- 3
SELECT film.title, film.release_year
FROM film
INNER JOIN film_actor USING(film_id)
INNER JOIN actor USING(actor_id)
WHERE first_name = LTRIM(UPPER('nick'));
AND last_name = LTRIM(UPPER('WAHLBeRG'));

-- 4
SELECT film.title, customer.first_name, rental.return_date, IF(rental.return_date < CURDATE(),'Yes','No')
FROM film
INNER JOIN inventory USING(film_id)
INNER JOIN rental USING(inventory_id)
INNER JOIN customer USING(customer_id)
WHERE EXTRACT(month FROM rental.rental_date) BETWEEN 5 AND 6;

