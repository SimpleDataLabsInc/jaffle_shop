WITH orders AS (

  SELECT * 
  
  FROM {{ source('prophecy_dataset_samples.tests', 'orders') }}

),

customers AS (

  SELECT * 
  
  FROM {{ source('prophecy_dataset_samples.tests', 'customers') }}

),

Join_1 AS (

  SELECT 
    orders.order_id AS order_id,
    orders.order_date AS order_date,
    orders.status AS status,
    orders.credit_card_amount AS credit_card_amount,
    orders.coupon_amount AS coupon_amount,
    orders.bank_transfer_amount AS bank_transfer_amount,
    orders.gift_card_amount AS gift_card_amount,
    orders.amount AS amount,
    customers.total_orders AS total_orders,
    customers.first_order AS first_order,
    customers.customer_lifetime_value AS customer_lifetime_value,
    customers.most_recent_order AS most_recent_order,
    customers.customer_id AS customer_id,
    customers.first_name AS first_name,
    customers.last_name AS last_name
  
  FROM customers
  INNER JOIN orders
     ON customers.customer_id = orders.customer_id

)

SELECT *

FROM Join_1
