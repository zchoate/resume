FROM python:3-bullseye

RUN pip install -r requirements.txt && \
    mkdir /data

COPY main.py /data/main.py

WORKDIR /data

CMD ["python", "main.py"]