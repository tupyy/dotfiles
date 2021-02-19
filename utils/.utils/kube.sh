#!/bin/bash

function klogs() {
    k=`which kubectl`
    podName=$(k get pods | grep $1 | awk '{print $1}')
    if [ $podName"x" != "x" ]; then
        k logs $podName
    else
        echo "cannot find pod: $1"
    fi
}
