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
				
-- 3  revisar

SELECT first_name, last_name
FROM customer c1
WHERE NOT EXISTS (SELECT *
					FROM rental r1,customer c2
					WHERE r1.customer_id = c2.customer_id
					AND c1.customer_id <> c2.customer_id);
					
-- 4 revisar
					
SELECT first_name, last_name
FROM customer c1
WHERE EXISTS (SELECT *
					FROM rental r1,customer c2
					WHERE r1.customer_id = c2.customer_id
					AND c1.customer_id <> c2.customer_id);
					
-- 5

SELECT first_name, last_name
FROM actor
WHERE actor.actor_id IN (SELECT *
						FROM actor,film_actor fa1, film f1
						WHERE actor.actor_id = fa1.actor_id
						AND fa1.actor_id = f1.film_id
						AND (f1.title = 'BETRAYED REAR' OR f1.title = 'CATCH AMISTAD'));
						
