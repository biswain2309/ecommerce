FROM python:3.8-alpine

RUN apk add --no-cache gcc python3-dev musl-dev jpeg-dev zlib-dev

WORKDIR /usr/src/app
COPY requirements.txt ./
RUN pip install -r requirements.txt
COPY . .

RUN python manage.py makemigrations
RUN python manage.py migrate

EXPOSE 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]