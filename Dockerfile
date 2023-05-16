FROM python:3.8-slim-buster
WORKDIR /app

COPY requirements.txt requirements.txt
RUN  pip3 install -r requirements.txt

COPY . .
RUN -d --expose 3000 -p 80:8080
CMD python3 main.py


