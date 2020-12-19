#!/bin/bash

DEFAULT="\e[39m"
GREEN="\e[32m"
RED="\e[31m"
alias cls='clock_sync'
function clock_sync() {
    test -f /usr/sbin/VBoxService || return 0
    sudo /usr/sbin/VBoxService --timesync-set-start --timesync-set-on-restore --timesync-set-threshold 1000 --timesync-interval 5000
    return
}

# AWS
function check_aws_connection() {
    echo -en "${DEFAULT}AWS_CONNECTION :"  && aws ec2 describe-addresses > /dev/null && { echo -e "{GREEN}OK"; return 0; } || { echo -e "${RED}KO"; return 1; }
}

alias adl='adfs_login'
function adfs_login() {
    export AWS_DEFAULT_REGION="eu-central-1"
    # insert your uid here, this is a little reminder of the username format required by ADFS
    echo "uie12468@cw01"
    if [[ "$1" == "" ]];
    then
        aws-adfs login --adfs-host adfs.contiwan.com --session-duration 14400
    else
        aws-adfs login --adfs-host adfs.contiwan.com --profile $1 --session-duration 14400
        export AWS_PROFILE=$1
    fi
    check_aws_connection || { echo -e "${DEFAULT}Sync VM clock : " && clock_sync && check_aws_connection; }
}
