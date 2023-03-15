WITH source AS (

  {#-
  Normally we would select from the table here, but we are using seeds to load
  our data in this project
  #}
  SELECT * 
  
  FROM {{ ref('raw_orders')}}

),

Reformat_1 AS (

  SELECT 
    id AS id,
    user_id AS user_id
  
  FROM source AS in0

),

renamed AS (

  SELECT 
    id AS order_id,
    user_id AS customer_id,
    order_date,
    status
  
  FROM source

)

SELECT * 

FROM renamed
