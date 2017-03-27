SELECT name AS val FROM category WHERE name LIKE 'A%' OR name LIKE 'M%' UNION SELECT title FROM film WHERE title LIKE 'A%' OR title LIKE 'S%';

SELECT f.title, f.special_features, f.rental_rate, c.name 
FROM film f, film_category fc, category c 
WHERE f.film_id = fc.film_id 
AND fc.category_id = c.category_id 
ORDER BY f.rental_rate DESC, f.special_features ASC;

SELECT f1.title, f2.title, f1.`length`
FROM film f1, film f2
WHERE f1.`length` = f2.`length` AND f1.film_id > f2.film_id
ORDER BY 1;

-- Exercises

-- 1

SELECT title, special_features
FROM film
WHERE rating = 'PG-13';

-- 2

SELECT DISTINCT `length`
FROM film;

-- 3

SELECT title, rental_rate, replacement_cost 
FROM film
WHERE replacement_cost BETWEEN '20,00' AND '24,00';

-- 4

SELECT f.title, f.rating, c.name
FROM film f , category c , film_category fc
WHERE f.film_id = fc.film_id
AND c.category_id = fc.category_id
AND f.special_features LIKE '%Behind the Scenes%';

-- 5

SELECT actor.first_name, actor.last_name
FROM actor, film, film_actor
WHERE actor.actor_id = film_actor.actor_id
AND film.film_id = film_actor.film_id
AND film.title LIKE '%ZOOLANDER FICTION%';

-- 6

SELECT address.address, city.city, country.country
FROM address, city, country, store
WHERE store_id = 1
AND store.address_id = address.address_id
AND address.city_id = city.city_id
AND city.country_id = country.country_id;

-- 7

SELECT film.title, film.rating
FROM film
WHERE film.rating = film.rating
