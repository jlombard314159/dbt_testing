# as far as I am aware this installs airflow and python
FROM python:3.11


USER root

RUN apt-get update
RUN apt-get upgrade -y

WORKDIR /app

COPY . .


RUN pip install --upgrade pip
RUN pip install --no-cache-dir --progress-bar off -r requirements.txt

# RUN apt-get install -y sqlite3 libsqlite3-dev
RUN mkdir /db

RUN apt-get install -y r-base

RUN Rscript -e "install.packages(c('RSQLite','DBI','dplyr','dbplyr'))"

CMD ["python3"]