sudo yum install -y nc
echo "carbon.agents.graphite-tutorial.metricsReceived 28198 `date +%s`" | nc localhost 2003
echo "carbon.agents.graphite-tutorial.creates 8 `date +%s`" | nc localhost 2003
echo "PRODUCTION.host.graphite-tutorial.responseTime.p95 0.10 `date +%s`" | nc localhost 2003

tail -f /opt/graphite/storage/log/carbon-cache/carbon-cache-a/creates.log
