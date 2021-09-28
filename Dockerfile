FROM python:3.9.0

WORKDIR /home/

RUN echo 'asdhasdh'

RUN git clone https://github.com/noeul1114/gis_6ban_1.git

WORKDIR /home/gis_6ban_1/

RUN pip install -r requirements.txt

RUN pip install gunicorn

RUN pip install mysqlclient

EXPOSE 8000

CMD ["bash", "-c", "python manage.py collectstatic --noinput --settings=gis_6ban_1.settings.deploy && python manage.py migrate --settings=gis_6ban_1.settings.deploy && gunicorn --env DJANGO_SETTINGS_MODULE=gis_6ban_1.settings.deploy gis_6ban_1.wsgi --bind 0.0.0.0:8000"]





