FROM python:alpine3.11

RUN adduser --disabled-password --gecos '' -u 1001 app
USER app
WORKDIR /home/app

COPY --chown=app:app app.py app.py

EXPOSE 8000

CMD [ "python3", "app.py" ]