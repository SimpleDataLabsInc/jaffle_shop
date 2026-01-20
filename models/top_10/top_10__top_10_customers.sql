{{
  config({    
    "materialized": "ephemeral",
    "database": "danyelle",
    "schema": "demo"
  })
}}

WITH orders_1 AS (

  SELECT * 
  
  FROM {{ source('danyelle.demo', 'orders') }}

),

customers AS (

  SELECT * 
  
  FROM {{ source('danyelle.demo', 'customers') }}

),

customer_order_details AS (

  SELECT 
    customers.customer_id AS CUSTOMER_ID,
    customers.first_name AS FIRST_NAME,
    customers.last_name AS LAST_NAME,
    orders_1.amount
  
  FROM customers
  INNER JOIN orders_1
     ON customers.customer_id = orders_1.customer_id

),

customer_total_spend AS (

  SELECT 
    CUSTOMER_ID,
    FIRST_NAME,
    LAST_NAME,
    SUM(amount) AS TOTAL_SPEND
  
  FROM customer_order_details
  
  GROUP BY 
    CUSTOMER_ID, FIRST_NAME, LAST_NAME

),

sorted_by_spend AS (

  SELECT * 
  
  FROM customer_total_spend
  
  ORDER BY TOTAL_SPEND DESC NULLS FIRST

),

top_10_customers AS (

  SELECT * 
  
  FROM sorted_by_spend
  
  LIMIT 10

)

SELECT *

FROM top_10_customers
