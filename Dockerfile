FROM apache/airflow:2.10.2-python3.8

COPY requirements.txt /app/requirements.txt
WORKDIR /app
RUN pip install -r requirements.txt

COPY ./dags /opt/airflow/dags
COPY ./secrets /opt/airflow/secrets
COPY ./logs /opt/airflow/logs

# Create new user 'ubuntu' to match PROD env server variable and set permissions for Airflow user to read/write/execute in the new user's home directory
USER root
RUN mkdir -p /home/ubuntu/temp \
    && chown -R airflow: /home/ubuntu/temp

RUN mkdir -p /home/ubuntu/config \
    && chown -R airflow: /home/ubuntu/config

USER airflow
