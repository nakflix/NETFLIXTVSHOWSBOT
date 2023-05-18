FROM python:3.8-slim-buster
WORKDIR /app

COPY requirements.txt requirements.txt
RUN  pip3 install -r requirements.txt

COPY . .
RUN /usr/local/bin/python -m pip install --upgrade pip
CMD ["python3 main.py", "run", "--host=0.0.0.0:80"]

EXPOSE 80/tcp
















        










