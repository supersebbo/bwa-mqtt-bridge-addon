#!/usr/bin/with-contenv bashio
set -e

# Grab MQTT Settings from HA Service Broker
MQTT_HOST=$(bashio::services mqtt "host")
MQTT_USER=$(bashio::services mqtt "username")
MQTT_PASSWORD=$(bashio::services mqtt "password")

# Concat the MQTT URI
MQTT_URI="mqtt://${MQTT_USER}:${MQTT_PASSWORD}@${MQTT_HOST}"

# Send the MQTT URI to the console for debugging - CAUTION: Password included
echo "MQTT server: $MQTT_URI"

# Get the connection method from addon config
CONN=$(bashio::config "connection_type")
echo "Connection type is $CONN"

# Grab the Bridge Device and Port from the Addon Config
BRIDGE_DEVICE=$(bashio::config "bridge_address")
BRIDGE_PORT=$(bashio::config "bridge_port")

# Create the connection string for the selected connection method
if [ $CONN == 'tcp' ]
then
    if [ -n $BRIDGE_PORT ]
    then
        DEVICE_URI="tcp://${BRIDGE_DEVICE}:${BRIDGE_PORT}/"
        echo "Using TCP Bridge at $DEVICE_URI"
    else
        echo "ERROR: TCP connection selected but no port number provided - check Add-On config page"
    fi
elif [ $CONN == 'local' ]
then
    DEVICE_URI=$BRIDGE_DEVICE
    echo "Using local RS485 Device at $DEVICE_URI"
elif [ $CONN == 'rfc2217' ]
then
    if [ -n $BRIDGE_PORT ]
    then
        DEVICE_URI="rfc2217://${BRIDGE_DEVICE}:${BRIDGE_PORT}/"
        echo "Using rfc2217 Device at $DEVICE_URI"
    else
        echo "ERROR: RFC2217 connection selected but no port number provided - check Add-On config page"
    fi
else
    echo "ERROR: No valid device config found"
fi

# Concat the TCP Connection String
#DEVICE_URI="tcp://${BRIDGE_DEVICE}:${BRIDGE_PORT}/"

# Run the bwa-mqtt-bridge gem
# TO DO Pull TCP settings from Addon config
/usr/local/bundle/bin/bwa_mqtt_bridge ${MQTT_URI} ${DEVICE_URI}
