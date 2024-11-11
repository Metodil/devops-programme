FROM ubuntu:24.04

RUN useradd meto && apt-get update && apt-get install -y python3 python3-pip

WORKDIR /app
COPY --chown=meto requirements.txt .
RUN pip install --break-system-packages -r requirements.txt
COPY --chown=meto app/  /app

USER meto

CMD [ "python3", "app.py" ]