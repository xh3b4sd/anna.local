#!/bin/bash

cd /tmp/anna.local/

fleetctl start prometheus/prometheus.service
fleetctl start anna/redis.service
fleetctl start anna/anna.service
fleetctl start grafana/grafana.service
fleetctl start traefik/traefik.service
