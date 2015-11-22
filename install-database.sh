#!/bin/bash

sudo bash -c 'cd /opt/graphite ; export PATH=$PATH:/usr/lib/python2.7/site-packages/django/bin ; export PYTHONPATH=$PYTHONPATH:`pwd`/webapp ; django-admin.py syncdb --settings=graphite.settings'

ls -l /opt/graphite/storage/graphite.db

pushd /opt/graphite/webapp/graphite
sudo cp local_settings.py.example local_settings.py
popd
