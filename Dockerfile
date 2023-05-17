FROM python:3.8-slim-buster
WORKDIR /app

COPY requirements.txt requirements.txt
RUN  pip3 install -r requirements.txt

COPY . .
RUN apk add --no-cache python3 py3-pip tini; \
        pip install --upgrade pip setuptools-scm; \
        python3 setup.py install; \
        python3 martor_demo/manage.py makemigrations; \
        python3 martor_demo/manage.py migrate; \
        addgroup -g 1000 appuser; \
        adduser -u 1000 -G appuser -D -h /app appuser; \
        chown -R appuser:appuser /app
        
# Setting a port for your app communications with Telegram servers.

USER appuser

EXPOSE 8000/tcp

ENTRYPOINT [ "tini", "--" ]
CMD  [ "python3 main.py", "/app/martor_demo/manage.py", "runserver", "0.0.0.0:8000" ]


