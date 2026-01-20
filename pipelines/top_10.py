with DAG():
    customers = Task(
        task_id = "customers", 
        component = "Dataset", 
        writeOptions = {"writeMode" : "overwrite"}, 
        table = {"name" : "customers", "sourceType" : "Table", "sourceName" : "danyelle.demo", "alias" : ""}
    )
    orders_1 = Task(
        task_id = "orders_1", 
        component = "Dataset", 
        writeOptions = {"writeMode" : "overwrite"}, 
        table = {"name" : "orders", "sourceType" : "Table", "sourceName" : "danyelle.demo", "alias" : ""}
    )
