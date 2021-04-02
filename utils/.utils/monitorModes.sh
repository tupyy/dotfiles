#!/bin/bash

function changeMode() {
    xrandr --output Virtual1 --mode $1
}
