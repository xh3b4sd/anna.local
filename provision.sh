#!/bin/bash

cd /tmp/anna.local/

fleetctl start prometheus/prometheus.service
fleetctl start anna/redis.service
fleetctl start anna/anna.service
fleetctl start grafana/grafana.service
fleetctl start traefik/traefik.service

# Wait until grafana is up.
curl --output /dev/null --silent --fail http://admin:admin@grafana.anna.local/api/dashboards/home
while [ $? -ne ]; do
  sleep 1
done

# Create data sources and dashboards as soon as grafana is up.
curl -H "Content-Type:application/json" -d @/tmp/anna.local/grafana/data_source.json http://admin:admin@grafana.anna.local/api/datasources
curl -H "Content-Type:application/json" -d @/tmp/anna.local/grafana/dashboard.json http://admin:admin@grafana.anna.local/api/dashboards/db
