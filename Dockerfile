FROM python:3.8-slim-buster
WORKDIR /app

COPY requirements.txt requirements.txt
RUN  pip3 install -r requirements.txt

COPY . .










        
# Setting a port for your app communications with Telegram servers.



EXPOSE 8000/tcp

ENTRYPOINT [ "tini", "--" ]
CMD  [ "python3 main.py", "/app/martor_demo/manage.py", "runserver", "0.0.0.0:8000" ]


