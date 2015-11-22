#!/bin/bash
sudo yum install -y cairo-devel
sudo yum install -y pycairo-devel
sudo yum install -y rrdtool-python
#sudo pip install django
sudo yum install -y python-django
#sudo pip install pyparsing
sudo yum install -y pyparsing
#sudo pip install django-tagging
sudo yum install -y python-django-tagging
#sudo pip install python-memcached
sudo yum -y install python-memcached
sudo pip install txamqp
#sudo pip install pytz
sudo yum install -y pytz
sudo yum install -y python-ldap
sudo pip install whitenoise
cd /tmp
git clone https://github.com/graphite-project/graphite-web.git
pushd graphite-web
sudo python setup.py install
ls -l /opt/graphite/webapp/
python check-dependencies.py
popd
