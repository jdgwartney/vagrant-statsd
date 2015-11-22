#!/bin/bash
ls -l /opt/graphite/storage/whisper/carbon/agents/graphite-tutorial/

ls -l /opt/graphite/storage/whisper/PRODUCTION/host/graphite-tutorial/responseTime/

whisper-info.py /opt/graphite/storage/whisper/PRODUCTION/host/graphite-tutorial/responseTime/p95.wsp 

echo ""

# whisper-dump.py /opt/graphite/storage/whisper/PRODUCTION/host/graphite-tutorial/responseTime/p95.wsp 

echo ""
