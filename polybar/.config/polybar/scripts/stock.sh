#!/bin/bash

RESET_COLOR='%{F-}'
COLOR_RED='%{F#f00}'
COLOR_GREEN='%{F#0f0}'

CRAWLER_URL="http://localhost:18080/stock"

if [ "x"$1 != "x" ]; then
    CRAWLER_URL="${CRAWLER_URL}?label=$1"
fi

data=`curl -s ${CRAWLER_URL}`
test $? -eq 0 || exit 0
if [ "x"$data == "x" ]; then
    exit 0
fi

value=`echo "${data}" | jq '.values[0].value'`
fmtValue=`printf "%4.3f" $value`
variation=`echo "${data}" | jq '.values[0].variation' | head -c 4` 

if [ $variation != "null" ]; then
    if (( $(echo "$variation <= 0"|bc -l) )); then
        fmtVar=`printf "%1.2f" $variation`
        var="${COLOR_RED}${fmtVar}${RESET_COLOR}"
    else
        fmtVar=`printf "%1.2f" $variation`
        var="${COLOR_GREEN}+${variation}${RESET_COLOR}"
    fi
fi


echo -e "$1: ${fmtValue} ${var}"



