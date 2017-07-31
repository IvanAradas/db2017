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

    
-- 5






