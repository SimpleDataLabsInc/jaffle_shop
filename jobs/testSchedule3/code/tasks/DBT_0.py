def DBT_0():
    settings = {}
    from datetime import timedelta
    from airflow.operators.bash import BashOperator
    envs = {}

    return BashOperator(
        task_id = "DBT_0",
        bash_command = "set -euxo pipefail; tmpDir=`mktemp -d`; git clone -b main --depth=1 https://github.com/SimpleDataLabsInc/jaffle_shop $tmpDir; cd $tmpDir; dbt run; dbt test; ",
        env = envs,
        **settings
    )
