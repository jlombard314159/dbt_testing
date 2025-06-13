#JLO doesnt understand these things really. but its b/c of added layer of docker complexity
# Both creates the DB and launches the web UI
airflow api-server --port 4040

# Run the scheduler
airflow scheduler