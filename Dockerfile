FROM python:3.12-slim

RUN apt-get update && apt-get install -y \
    libpango-1.0-0 \
    libpangoft2-1.0-0 \
    libharfbuzz0b \
    libffi-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . /app

RUN pip install --no-cache-dir -r requirements.txt ipython nbconvert

RUN jupyter nbconvert --to script AppAuditorias.ipynb

ENV GRADIO_SERVER_NAME="0.0.0.0"

EXPOSE 7860

CMD ["ipython", "AppAuditorias.py"]
