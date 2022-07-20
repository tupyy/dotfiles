#!/bin/sh

ICON=""
COLOR="#2fd5fa"
speed=$(sensors | grep fan1 | awk '{print $2; exit}')
level=$(cat /proc/acpi/ibm/fan | grep level: | awk '{print $2; exit}')

output="#"

if [ "$speed" != "" ]; then
    output="%{F$COLOR}$ICON $speed%{F-}"
fi

if [ "$level" != "" ]; then
    output="%{F$COLOR}$ICON $speed | $level%{F-}"
fi

echo $output
