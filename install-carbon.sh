#!/bin/bash
sudo yum update -y
sudo yum install -y epel-release
sudo yum groupinstall -y "Development Tools"
sudo yum install -y python-devel
sudo yum install -y git
sudo yum install -y python-pip
sudo pip install pip --upgrade

# wget https://bootstrap.pypa.io/get-pip.py
# sudo python get-pip.py
sudo pip install twisted

cd /tmp
git clone https://github.com/graphite-project/carbon.git
pushd /tmp/carbon
sudo python setup.py install
popd

ls -l /opt/graphite
