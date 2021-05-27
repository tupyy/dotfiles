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

function prompt_k8s() {
    k8s_current_context=$(kubectl config current-context 2> /dev/null)
    if [[ $? -eq 0 ]] ; then
        echo -e "${k8s_current_context}" | awk '$0 ~ /integration/ {print "int"}; $0 ~ /validation/ {print "val"}'
    fi
}
