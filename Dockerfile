FROM python:3.11-slim-bookworm

RUN apt-get update && apt-get install -y --no-install-recommends \
    libpango-1.0-0 \
    libpangoft2-1.0-0 \
    libcairo2 \
    libgdk-pixbuf-2.0-0 \
    fontconfig \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir /data

WORKDIR /data

COPY requirements.txt .

RUN python -m pip install --upgrade pip && \
    pip install -r requirements.txt

COPY main.py .
COPY templates/ templates/

CMD ["python", "main.py"]