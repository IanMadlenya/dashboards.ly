FROM ubuntu:14.04

RUN apt-get update && \
    apt-get -y install python python-pip libpq-dev python-dev && \
    apt-get clean

COPY requirements.txt /opt/dashboardsly/
RUN cd /opt/dashboardsly && pip install -r requirements.txt

COPY run-container /
COPY init_db.py runserver.py /opt/dashboardsly/
COPY dashboardsly /opt/dashboardsly/dashboardsly/

EXPOSE 80
CMD /run-container
