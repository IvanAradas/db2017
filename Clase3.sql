SELECT title, rating, length FROM film WHERE LENGTH > 100;

 -- BETWEEN toma los dos valores extremos (este caso 100 y 120 incluido)

SELECT title, `length` FROM film WHERE `length` BETWEEN 100 AND 120;

SELECT city, district FROM address, city WHERE address.city_id = city.city_id;

SELECT title, name FROM film, `language` WHERE film.language_id = `language`.language_id;

SELECT DISTINCT country, city FROM address, city, country WHERE address.city_id = city.city_id AND city.country_id = country.country_id;

SELECT title, name FROM film, `language` WHERE film.language_id = language.language_id AND film.`length` > 100 AND language.name = 'English';

SELECT title, special_features, rental_rate, name FROM film, film_category, category WHERE film.film_id = film_category.film_id AND film_category.category_id = category.category_id ORDER BY rental_rate DESC;

SELECT title, special_features, rental_rate, name FROM film, film_category, category WHERE film.film_id = film_category.film_id AND film_category.category_id = category.category_id ORDER BY rental_rate DESC, special_features;

SELECT * FROM film WHERE special_features LIKE '%Trailers%';

SELECT * FROM address WHERE address LIKE '%\_%';

SELECT title, description, rental_rate * 15 AS "In pesos" FROM film ORDER BY `In pesos` DESC; 

SELECT title, description, rental_rate * 15 FROM film; 

SELECT name FROM category WHERE name LIKE 'A%' OR name LIKE 'M%'
UNION
SELECT name FROM category WHERE name LIKE 'A%' OR name LIKE 'S%'
