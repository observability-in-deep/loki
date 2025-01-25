#!/bin/bash

if [[ "$OSTYPE" != "linux-gnu"* ]]; then
    echo "This script is intended to run on Linux. Please visit the following URL to install on your OS:"
    exit 1
fi

if ! [ -x "$(command -v helm)" ]; then
    echo "helm is not installed. Please install helm first."
    exit 1
fi

helm install grafana  oci://registry-1.docker.io/bitnamicharts/grafana 
helm install loki  oci://registry-1.docker.io/bitnamicharts/grafana-loki
timeout 60s kubectl wait --for=condition=ready pod -l app=grafana
