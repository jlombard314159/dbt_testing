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

# if we want to install a custom thing
# # install edl utils
# RUN pip install ./wheels/edl_utils-0.0.1-py2.py3-none-any.whl

# ##NOTE: Enter token by looking at the log
# CMD ["jupyter", "lab", "--ip", "0.0.0.0", "--port", "8888", "--allow-root"]