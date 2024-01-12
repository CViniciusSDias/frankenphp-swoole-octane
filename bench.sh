#!/usr/bin/env sh

echo
echo "Swoole"
wrk -t16 -c100 -d5s --latency http://swoole:9802/api/health-check
wrk -t16 -c100 -d5s --latency http://swoole:9802/api/static
wrk -t16 -c100 -d5s --latency http://swoole:9802/api/http-request
wrk -t16 -c100 -d5s --latency http://swoole:9802/api/db-operation

sleep 30

echo
echo "FrankenPHP"
wrk -t16 -c100 -d5s --latency http://frankenphp:9804/api/health-check
wrk -t16 -c100 -d5s --latency http://frankenphp:9804/api/static
wrk -t16 -c100 -d5s --latency http://frankenphp:9804/api/http-request
wrk -t16 -c100 -d5s --latency http://frankenphp:9804/api/db-operation

# Swoole
1. 9179.55
2. 8176.14
3. 3101.98
4. 152.03

# FrankenPHP
1. 6819.38
2. 6702.74
3. 2787.60
4. 150.58
