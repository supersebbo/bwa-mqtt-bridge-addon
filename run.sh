#!/usr/bin/with-contenv bashio
set -e

# Grab MQTT Settings from HA Service Broker
MQTT_HOST=$(bashio::services mqtt "host")
MQTT_USER=$(bashio::services mqtt "username")
MQTT_PASSWORD=$(bashio::services mqtt "password")

# Concat the MQTT URI
MQTT_URI="mqtt://${MQTT_USER}:${MQTT_PASSWORD}@${MQTT_HOST}"

# Run the bwa-mqtt-bridge gem
# TO DO Pull TCP settings from Addon config
/usr/local/bundle/bin/bwa_mqtt_bridge ${MQTT_URI} tcp://10.10.10.214:9999/
