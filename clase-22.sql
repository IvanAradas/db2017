-- 1 
SELECT fat_content 
FROM (
  SELECT DISTINCT fat_content 
  FROM product_dimension 
  WHERE department_description 
  IN ('Dairy') ) AS food 
  ORDER BY fat_content
  LIMIT 5;
  
  -- Top 5 de los lacteos con la menor cantidad de contenido graso
  
  SELECT DISTINCT fat_content
  FROM product_dimension
  WHERE department_description
  IN ('Dairy')
  ORDER BY 1
  LIMIT 5;

 -- 2 Explain this query

SELECT order_number, date_ordered
FROM store.store_orders_fact orders
WHERE orders.store_key IN (
  SELECT store_key
  FROM store.store_dimension
  WHERE store_state = 'MA') 
AND orders.vendor_key NOT IN (
    SELECT vendor_key
    FROM public.vendor_dimension
    WHERE vendor_state = 'MA')
AND date_ordered < '2003-03-01';

-- Devuelve el numero de orden y fecha de las orden store de massachuset de los vendedores que no son de massachuset


-- 3 Requests female and male customers with the maximum 
-- annual income from customers

SELECT customer_name, annual_income
FROM public.customer_dimension
WHERE (customer_gender, annual_income) IN
      (SELECT customer_gender, MAX(annual_income)
       FROM public.customer_dimension
       GROUP BY customer_gender);
       
       
-- 4 IN predicate
-- Find all products supplied by stores in MA

 SELECT DISTINCT s.product_key, p.product_description
FROM store.store_sales_fact s, public.product_dimension p
WHERE s.product_key = p.product_key
    AND s.product_version = p.product_version
    AND s.store_key IN
      (SELECT store_key
       FROM store.store_dimension
       WHERE store_state = 'MA')
ORDER BY s.product_key;


-- 5
-- EXISTS predicate
-- Get a list of all the orders placed by all stores on 
-- January 2, 2003 for the vendors with records in the 
-- vendor_dimension table 

SELECT *
FROM store.store_orders_fact, public.vendor_dimension
WHERE date_ordered='2003-01-02'
AND store.store_orders_fact.vendor_key = public.vendor_dimension.vendor_key;

SELECT *
FROM store.store_orders_fact f
WHERE EXISTS (SELECT 1
				FROM vendor_dimension d
				WHERE d.vendor_key = f.vendor_key )
AND date_ordered = '2003-01-02';

-- 6
-- EXISTS predicate
-- Orders placed by the vendor who got the best deal 
-- on January 4, 2004


SELECT MAX(public.vendor_dimension.deal_size)
FROM store.store_orders_fact, public.vendor_dimension
WHERE date_ordered='2004-01-04';

SELECT MAX(public.vendor_dimension.deal_size)
FROM store.store_orders_fact f , public.vendor_dimension
WHERE EXISTS (SELECT 1
				FROM public.vendor_dimension d
				WHERE d.vendor_key = f.vendor_key)
AND date_ordered = '2004-01-04';

-- 7
-- Multicolumn subquery
-- Which products have the highest cost, 
-- grouped by category and department 

--- NO HACERRR
--- NO HACERRR
--- NO HACERRR
--- NO HACERRR

-- 8
-- Using pre-join projections to answer subqueries
-- between online_sales_fact and online_page_dimension

--- NO HACERRR
--- NO HACERRR
--- NO HACERRR
--- NO HACERRR






