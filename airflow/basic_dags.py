'''
Example DAGS
'''

import textwrap
from datetime import datetime, timedelta

# DBT uses bashoperator me thinks
from airflow.providers.standard.operators.bash import BashOperator
from airflow.sdk import DAG


dag_args = {
    "depends_on_past": False,
    "retries": 1,
    "retry_delay": timedelta(minutes=1)
}

with DAG(
    "test",
    default_args=dag_args,
    description="Test DAG",
    schedule=timedelta(days=1),
    start_date=datetime(2025, 6, 13),
    catchup=False,
    tags=["dbt"]
) as dag:

    geo_task = BashOperator(
        task_id='geo_creation',
        bash_command='dbt build ',
        dag=dag
    )

    analysis_task = BashOperator(
        task_id='analysis',
        bash_command='dbt build',
        dag=dag
    )
    
    test_dbt = BashOperator(
        task_id='testing',
        bash_command='dbt test',
        dag=dag
    )

    geo_task >> analysis_task >> test_dbt