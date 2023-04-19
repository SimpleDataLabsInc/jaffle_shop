import os
import sys
import pendulum
from datetime import timedelta
import airflow
from airflow.decorators import dag
sys.path.insert(0, os.path.abspath(os.path.dirname(__file__)))
from tasks import 
PROPHECY_RELEASE_TAG = "__PROJECT_ID_PLACEHOLDER__/__PROJECT_RELEASE_VERSION_PLACEHOLDER__"

@dag(
     dag_id = "dbt_apr19_2", 
     schedule_interval = "0 0/1 * * *", 
     default_args = {"owner" : "Prophecy", "ignore_first_depends_on_past" : True, "do_xcom_push" : True}, 
     start_date = airflow.utils.dates.days_ago(0), 
     catchup = True, 
     tags = []
)
def dag():
    pass

dag()
