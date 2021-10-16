#!/bin/bash

function changeMode() {
    if [ $1 == "ModeDell" ]; then
        xrandr --output Virtual1 --mode $1 --scale 0.8x0.8
    fi
    xrandr --output Virtual1 --mode $1
}
