# FROM python:3-bullseye
FROM ubuntu

RUN apt-get update && \
    apt-get install -y python3-pip python3-cffi python3-brotli libpango-1.0-0 libharfbuzz0b libpangoft2-1.0-0

RUN mkdir /data

WORKDIR /data

COPY requirements.txt .

RUN python3 -m pip install --upgrade pip && \
    pip install -r requirements.txt

COPY main.py .

CMD ["python", "main.py"]