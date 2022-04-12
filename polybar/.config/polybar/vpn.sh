#!/bin/bash

## [Set VPN status parsing]
# The first command cuts the status, which is compared to keywords below.
# Note from Julia: this should cover most VPNs, if it's missing something let me know
VPN_NAME="$(nmcli connection show --active | grep "vpn" | cut -d" " -f1)"

## [Set colors] (set each variable to nothing for default color)
ICON_CONNECTED=""
ICON_CONNECTING="ﱱ"
ICON_DISCONNECTED=""
COLOR_CONNECTED="#a5fb8f"
COLOR_CONNECTING="#FAE3B0"
COLOR_DISCONNECTED="#f087bd"

if [ ! -z "$VPN_NAME" ]; then
    echo "%{F$COLOR_CONNECTED}$ICON_CONNECTED $VPN_NAME%{F-}"
else
	echo "%{F$COLOR_DISCONNECTED}$ICON_DISCONNECTED No VPN%{F-}"
fi
