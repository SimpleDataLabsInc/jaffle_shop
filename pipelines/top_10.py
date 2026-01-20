with DAG():
    top_10__top_10_customers = Task(
        task_id = "top_10__top_10_customers", 
        component = "Model", 
        modelName = "top_10__top_10_customers"
    )
