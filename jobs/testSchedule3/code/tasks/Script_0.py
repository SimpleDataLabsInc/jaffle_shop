def Script_0():
    settings = {}
    from datetime import timedelta
    from airflow.operators.python import PythonOperator

    return PythonOperator(
        task_id = "Script_0",
        python_callable = lambda *args, **kwargs: exec("print(\"hello\")"),
        **settings
    )
