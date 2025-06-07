# Common dbt things to run sequence
conda activate dbt_testing
cd ./dbt_testing

dbt debug
dbt run 
dbt test