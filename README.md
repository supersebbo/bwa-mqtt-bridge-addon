# bwa-mqtt-bridge-addon

This is the test repo for a Home Assistant Addon that packages the bwa-mqtt-bridge by @ccutrer.  It is intended for testing by advanced users only - this will eventually be published as a full add-on which will have more general appeal.  Currently it assumes you have an internal HA MQTT server addon that advertises itself an an MQTT broker (the official Mosquitto addon for example) and will pull the host/username/password automatically.  Internal MQTT is listed as a needed dependency in the addon so it will fail if you don't have this, connecting to an external MQTT server is beyond the scope of this addon for now. 

To install, follow the instructions in the Wiki https://github.com/supersebbo/bwa-mqtt-bridge-addon/wiki/Installation-&-Run

