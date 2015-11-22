cd /opt/graphite/conf
sudo cp aggregation-rules.conf.example aggregation-rules.conf
sudo cp blacklist.conf.example blacklist.conf
sudo cp carbon.conf.example carbon.conf
sudo cp carbon.amqp.conf.example carbon.amqp.conf
sudo cp relay-rules.conf.example relay-rules.conf
sudo cp rewrite-rules.conf.example rewrite-rules.conf
sudo cp storage-schemas.conf.example storage-schemas.conf
sudo cp storage-aggregation.conf.example storage-aggregation.conf
sudo cp whitelist.conf.example whitelist.conf

pushd /opt/graphite/bin
sudo ./carbon-cache.py start

sleep 10
pgrep -fl | grep carbon-cache
netstat -an | grep 2003
popd
