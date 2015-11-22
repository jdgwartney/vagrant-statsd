#!/bin/bash
./install-carbon.sh

./install-whisper.sh

./start-carbon.sh

./send-data.sh

./data-files.sh

./install-graphite-web.sh
