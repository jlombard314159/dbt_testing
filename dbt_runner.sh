# Common dbt things to run sequence
conda activate dbt_testing
cd ./dbt_testing

dbt debug
dbt run 
dbt test

# Some additional things

#Generate SQL but no execution
dbt compile

#Create documentation
dbt docs generate

# Access the models. NOTE: Must run docs generate
dbt docs serve