-- 1

SELECT last_name, first_name
FROM actor a1
WHERE EXISTS (SELECT *
				FROM actor a2
				WHERE a1.last_name = a2.last_name
				AND a1.actor_id <> a2.actor_id)
ORDER BY last_name;

-- 2

SELECT a.actor_id, a.first_name, a.last_name
FROM actor a
WHERE a.actor_id NOT IN (SELECT fa.actor_id
						FROM film_actor fa);
				
-- 3

SELECT r1.rental_id, c.customer_id, c.first_name, c.last_name
FROM rental r1, customer c
WHERE NOT EXISTS (SELECT *
					FROM rental r2
					WHERE r1.customer_id = r2.customer_id
					AND r1.rental_id <> r2.rental_id)
AND r1.customer_id = c.customer_id;
					
-- 4

SELECT DISTINCT r1.rental_id, c.customer_id, c.first_name, c.last_name
FROM rental r1, customer c
WHERE EXISTS (SELECT DISTINCT *
					FROM rental r2
					WHERE r1.customer_id = r2.customer_id
					AND r1.rental_id <> r2.rental_id)
AND r1.customer_id = c.customer_id;

					
-- 5

SELECT actor.first_name, actor.last_name
FROM actor
WHERE actor.actor_id IN (SELECT *
						FROM actor,film_actor, film 
						WHERE actor.actor_id = film_actor.actor_id
						AND film_actor.actor_id = film.film_id
						AND title IN ('BETRAYED REAR' , 'CATCH AMISTAD'));
						
-- 6

SELECT actor.actor_id, actor.first_name, actor.last_name
FROM actor
WHERE actor_id IN (SELECT actor.actor_id
					FROM film_actor, actor, film
					WHERE actor.actor_id = film_actor.actor_id
					AND film.film_id = film_actor.film_id
					AND title = 'BETRAYED REAR')
AND actor_id NOT IN (SELECT actor.actor_id
					FROM film_actor, actor, film
					WHERE actor.actor_id = film_actor.actor_id
					AND film.film_id = film_actor.film_id
					AND title = 'CATCH AMISTAD');
					

						
