FROM python:3-bullseye

RUN mkdir /data

WORKDIR /data

COPY requirements.txt .

RUN python -m pip install --upgrade pip && \
    pip install -r requirements.txt

COPY main.py .

CMD ["python", "main.py"]