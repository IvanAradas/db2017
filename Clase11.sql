-- 1

SELECT country.country, COUNT(city.city_id)
FROM country,city
WHERE city.country_id = country.country_id
GROUP BY country.country;

-- 2

SELECT country.country, COUNT(city.city_id) AS canCity
FROM country,city
WHERE city.country_id = country.country_id
GROUP BY country.country
HAVING canCity > 10
ORDER BY `canCity` DESC;

-- 3

SELECT customer.first_name, customer.last_name, address.address, COUNT(rental.rental_id), SUM(payment.amount) AS total
FROM customer
	INNER JOIN address USING (address_id)
	INNER JOIN rental USING (customer_id)
	INNER JOIN payment USING (rental_id)
GROUP BY 1,2,3
ORDER BY 5 DESC;

-- 4

SELECT film.title
FROM film
WHERE film_id NOT IN (SELECT DISTINCT film_id
									FROM inventory);

-- 5 

SELECT title,inventory_id
FROM film
	INNER JOIN inventory USING(film_id)
	LEFT JOIN rental USING(inventory_id)
WHERE rental.rental_id IS NULL;

-- 6

SELECT first_name, last_name, 
FROM customer

