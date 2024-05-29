WITH orders AS (

  SELECT * 
  
  FROM {{ ref('orders')}}

),

customers AS (

  SELECT * 
  
  FROM {{ ref('customers')}}

),

by_customer_id AS (

  SELECT 
    customers.first_name AS first_name,
    customers.last_name AS last_name,
    customers.first_order AS first_order,
    customers.most_recent_order AS most_recent_order,
    customers.total_orders AS total_orders,
    customers.customer_lifetime_value AS customer_lifetime_value,
    orders.credit_card_amount AS credit_card_amount,
    orders.order_date AS order_date,
    orders.gift_card_amount AS gift_card_amount,
    orders.customer_id AS customer_id,
    orders.status AS status,
    orders.bank_transfer_amount AS bank_transfer_amount,
    orders.order_id AS order_id,
    orders.amount AS amount,
    orders.coupon_amount AS coupon_amount
  
  FROM orders
  INNER JOIN customers
     ON orders.customer_id = customers.customer_id

),

by_customer_id_amount AS (

  SELECT 
    customer_id AS CUSTOMER_ID,
    amount,
    CONCAT(first_name, ' ', last_name) AS full_name
  
  FROM by_customer_id

),

total_amount_by_customer AS (

  SELECT 
    CUSTOMER_ID,
    SUM(amount) AS TOTAL_AMOUNT
  
  FROM by_customer_id_amount
  
  GROUP BY CUSTOMER_ID

)

SELECT *

FROM total_amount_by_customer
