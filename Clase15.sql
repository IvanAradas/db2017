-- 1
CREATE VIEW list_of_customers AS
SELECT customer_id, CONCAT_WS(' ', customer.first_name, customer.last_name) AS customer_full_name, address, postal_code, phone, city, country, 
CASE WHEN active = 1 THEN "active" ELSE "inactive" END AS status, store_id
FROM customer
INNER JOIN address USING(address_id)
INNER JOIN city USING(city_id)
INNER JOIN country USING(country_id);

SELECT * FROM list_of_customers;

-- 2

CREATE VIEW film_details AS
SELECT film_id,
		title, 
		description, 
		category.name, 
		rental_rate, 
		`length`, 
		film.rating, 
		GROUP_CONCAT(CONCAT_WS(' ', first_name, last_name) SEPARATOR ',') AS actors
FROM film
INNER JOIN film_actor USING(film_id)
INNER JOIN actor USING(actor_id)
INNER JOIN film_category USING(film_id)
INNER JOIN category USING(category_id)
GROUP BY film_id,name;

SELECT * FROM film_details;

-- 3

select
    `c`.`name` AS `category`,
    sum( `p`.`amount` ) AS `total_rental`
from
    (
        (
            (
                (
                    (
                        `sakila`.`payment` `p` join `sakila`.`rental` `r` on
                        (
                            (
                                `p`.`rental_id` = `r`.`rental_id`
                            )
                        )
                    ) join `sakila`.`inventory` `i` on
                    (
                        (
                            `r`.`inventory_id` = `i`.`inventory_id`
                        )
                    )
                ) join `sakila`.`film` `f` on
                (
                    (
                        `i`.`film_id` = `f`.`film_id`
                    )
                )
            ) join `sakila`.`film_category` `fc` on
            (
                (
                    `f`.`film_id` = `fc`.`film_id`
                )
            )
        ) join `sakila`.`category` `c` on
        (
            (
                `fc`.`category_id` = `c`.`category_id`
            )
        )
    )
group by
    `c`.`name`
order by
    `total_rental` desc;
    
-- 4

-- actor id, first name, last name and the amount of films he/she acted on.

CREATE VIEW actor_information AS
SELECT actor_id, actor.first_name, actor.last_name, SUM(payment.amount) as total
FROM actor
INNER JOIN film_actor USING(actor_id)
INNER JOIN film USING(film_id)
INNER JOIN inventory USING(film_id)
INNER JOIN rental USING(inventory_id)
INNER JOIN payment USING(rental_id)
GROUP BY 1,2,3;

SELECT * FROM actor_information;
    
-- 5

-- Te muestra cada actor, el genereo y las peliculas que actuo en cada genero

SELECT * FROM actor_info;

-- 6
-- A materialized view is a replica of a target master from a single point in time. 
-- The master can be either a master table at a master site or a master materialized view at a materialized view site. 
-- Whereas in multimaster replication tables are continuously updated by other master sites, materialized views are updated from one or more masters through individual batch updates,
-- known as a refreshes, from a single master site or master materialized view site

-- Why Use Materialized Views?
--   + Ease Network Loads
--   + Create a Mass Deployment Environment
--   + Enable Data Subsetting
--   + Enable Disconnected Computing




