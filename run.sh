#!/usr/bin/with-contenv bashio
set -e

# Grab MQTT Settings from HA Service Broker
MQTT_HOST=$(bashio::services mqtt "host")
MQTT_USER=$(bashio::services mqtt "username")
MQTT_PASSWORD=$(bashio::services mqtt "password")

# Concat the MQTT URI
MQTT_URI="mqtt://${MQTT_USER}:${MQTT_PASSWORD}@${MQTT_HOST}"

# Send the MQTT URI to the console for debugging - CAUTION: Password included
echo $MQTT_URI

# Grab the Bridge IP and Port from the Addon Config
BRIDGE_IP=$(bashio::config "bridge_ip")
BRIDGE_PORT=$(bashio::config "bridge_port")

# Concat the TCP Connection String
TCP_URI="tcp://${BRIDGE_IP}:${BRIDGE_PORT}/"

# Send the TCP URI to the console for debugging
echo $TCP_URI

# Run the bwa-mqtt-bridge gem
# TO DO Pull TCP settings from Addon config
/usr/local/bundle/bin/bwa_mqtt_bridge ${MQTT_URI} ${TCP_URI}
