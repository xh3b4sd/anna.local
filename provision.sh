#!/bin/bash

cd /tmp/anna.local/unit/

fleetctl start prometheus.service
fleetctl start redis.service
fleetctl start anna.service
fleetctl start grafana.service
fleetctl start traefik.service
