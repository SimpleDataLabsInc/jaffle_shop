WITH customers AS (

  SELECT * 
  
  FROM {{ ref('customers')}}

),

orders AS (

  SELECT * 
  
  FROM {{ ref('orders')}}

),

join_customers_orders AS (

  {#Combines customer and order information, including the full name of each customer.#}
  SELECT 
    customers.CUSTOMER_ID,
    customers.FIRST_NAME,
    customers.LAST_NAME,
    orders.ORDER_ID,
    orders.AMOUNT,
    CONCAT(customers.FIRST_NAME, ' ', customers.LAST_NAME) AS full_name
  
  FROM customers
  INNER JOIN orders
     ON customers.CUSTOMER_ID = orders.CUSTOMER_ID

),

customer_order_summary AS (

  SELECT 
    CUSTOMER_ID,
    FIRST_NAME,
    LAST_NAME,
    COUNT(ORDER_ID) AS ORDER_COUNT,
    SUM(AMOUNT) AS TOTAL_REVENUE
  
  FROM join_customers_orders
  
  GROUP BY 
    CUSTOMER_ID, FIRST_NAME, LAST_NAME

),

OrderBy_1 AS (

  {#Sorts customer order summary in descending order based on total revenue.#}
  SELECT * 
  
  FROM customer_order_summary
  
  ORDER BY TOTAL_REVENUE DESC

)

SELECT *

FROM OrderBy_1
