# docker build -t dbt_test .

# # Create a container (need image is from docker image ls)
# docker container create 08460ee10e67

##NOTE: need to launch docker ot it will be MIA
## otherwise its \
docker compose -f 'docker-compose.yaml' up -d --build