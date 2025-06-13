FROM apache/airflow:2.6.3-python3.11

WORKDIR /app

COPY . /app

RUN apt-get updates && \ 
    apt-get install -y \
    sqlite3 && \
    mkdir /db

RUN pip install --upgrade pip
RUN pip install --no-cache-dir --progress-bar off -r requirements.txt


FROM rocker/tidverse

RUN Rscript -e "install.packages(c('RSQLite','DBI','dplyr'))"

cmd ["python"]