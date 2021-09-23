FROM python:3.9.0

WORKDIR /home/

RUN echo 'dfisfjls'

RUN git clone https://github.com/YuseonChoi/gis1.git

WORKDIR /home/gis1/

RUN pip install -r requirements.txt

RUN pip install gunicorn

RUN pip install mysqlclient

EXPOSE 8000

CMD ["bash", "-c", "python manage.py collectstatic --noinput --settings=gis1.settings.deploy && python manage.py migrate --settings=gis1.settings.deploy && gunicorn --env DJANGO_SETTINGS_MODULE=gis1.settings.deploy gis1.wsgi --bind 0.0.0.0:8000"]