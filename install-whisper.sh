#!/bin/bash
cd /tmp
git clone https://github.com/graphite-project/whisper.git
pushd /tmp/whisper
sudo python setup.py install
popd
