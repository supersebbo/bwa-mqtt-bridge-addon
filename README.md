# bwa-mqtt-bridge-addon

This is the test repo for a Home Assistant Addon that packages the bwa-mqtt-brige by @ccutrer.  It is intended for testing by advanced users only - this will eventually be published as a full add-on which will have more general appeal.  Currently it assumes you have the internal HA MQTT server. 

To install, follow the instructions at https://developers.home-assistant.io/docs/add-ons/tutorial at the very top (before step 1) to ensure you have file-system access to your HA instance. 

Copy/clone the files in this Repo to the /addons/bwa-mqtt-bridge directory on your HA instance (make the dir if it's the first time).  EDIT the run.sh file with the IP/Port of your RS485-Wifi adapter. In future this will be done through addon settting but for now it's hard coded. 

Go to Step 2 in the above tutorial to import tha new Local Add-on into HA. 

The first time the add-on builds/installs it will take a *long* time as it has to pull and install all the Ruby dependencies, depening on your HA system this could take as much as 30 minutes.  Leave the Addon installation page open so you can see when it finishes building (the spinner stops).

One it is complete, start the add-on from the HA Addons control page.  You can also check the logs here.  You should see something like:

```
s6-rc: info: service s6rc-oneshot-runner: starting
s6-rc: info: service s6rc-oneshot-runner successfully started
s6-rc: info: service fix-attrs: starting
s6-rc: info: service fix-attrs successfully started
s6-rc: info: service legacy-cont-init: starting
s6-rc: info: service legacy-cont-init successfully started
s6-rc: info: service legacy-services: starting
s6-rc: info: service legacy-services successfully started
W, Balboa MQTT Bridge running (version 2.1.4)
```

You can enable the HA Watchdog from the Addon control page to auto-restart the addon if it fails for any reason. 
