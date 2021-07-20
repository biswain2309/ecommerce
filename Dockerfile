FROM python:3.7-alpine

MAINTAINER Indrani Biswas <ibiswas.github.io>

EXPOSE 8000

RUN apk add --no-cache jpeg-dev zlib-dev
RUN apk add --no-cache --virtual .build-deps build-base linux-headers \
    && pip install Pillow

ADD . /ecommerce

WORKDIR /ecommerce

RUN pip install -r requirements.txt

RUN python ecommerce/manage.py makemigrations

RUN python ecommerce/manage.py migrate

CMD ["python", "ecommerce/manage.py", "runserver", "0.0.0.0:8000"]

