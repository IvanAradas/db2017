-- 1
SELECT * from address 
WHERE postal_code IN (SELECT postal_code from address AS ad WHERE ad.postal_code like "%515%");

CREATE INDEX address_code ON address(postal_code);

-- 2 last_name deberia ser mas performante por que tiene un indice
SELECT first_name FROM actor WHERE first_name LIKE "%grace%";
SELECT last_name FROM actor WHERE last_name LIKE "%crowe%";

-- 3 
ALTER TABLE film_text
ADD FULLTEXT(description);


SELECT description
FROM film_text
WHERE description like '%Cow%';

SELECT description
FROM film_text
WHERE MATCH(description) AGAINST('Cow');