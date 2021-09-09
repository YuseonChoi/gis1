FROM python:3.9.0

WORKDIR /home/

RUN git clone https://github.com/YuseonChoi/gis1.git

WORKDIR /home/gis1/

RUN echo 'SECRET_KEY=django-insecure-7(53c428jz8q5r767xs6=c=sb%0rxd=xs5%7byq!594o4u1j*@' > .env

RUN pip install -r requirements.txt

RUN pip install gunicorn

RUN python manage.py migrate

RUN python manage.py collectstatic

EXPOSE 8000

CMD ["gunicorn", "gis1.wsgi", "--bind", "0.0.0.0:8000"]