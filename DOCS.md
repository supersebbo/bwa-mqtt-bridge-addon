## Configuration Options
The addon is wraps bwa-mqtt-bridge which support TCP, local and RFC2217 connections.  Please read the following to ensure you configure correctly. 

| Config Option | Description | Default |
| --- | --- | --- |
| connection_type | Valid options are `tcp` for either the official Balboa WiFi module or a 3rd party RS485 to TCP bridge like the ELFIN-EW11. `local` for an RS485 adapter attached to your home-assistant host. `rfc2217` for an RFC2217 compatiable RS485 bridge. | `tcp` |
|  bridge_address | For `tcp` connection enter the IP address or local network host-name of the wifi bridge device example: `10.10.10.123` or `EW11.mynetwork`.  For `local` enter the local device path example: `\dev\mydevice`.  For `rfc2217` enter the IP or hostname of the RFC2217 bridge. | `null` |
| bridge_port | If using `wifi` or `rfc2217` enter the port that the bridge device is using.  If using `local` you can leave this as the default or enter `0` (it will be ignored in any case) | `8899` |
