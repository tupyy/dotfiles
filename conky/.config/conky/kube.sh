#!/bin/bash

offset=$(($2+500))
col1='${goto '"$offset"'}'
col2='${goto '"$(($offset+500))"'}'
col3='${goto '"$(($offset+620))"'}'
col4='${goto '"$(($offset+800))"'}'
col5='${goto '"$(($offset+950))"'}'
red='${color #e26e16}' # today's color
green='${color green}' # days of this month color
white='${color white}'

systemctl -q is-active gost
if [[ $? != 0 ]]; then
   echo "kube unavailable"
   exit 0
fi

# the next line is configurable
tmp="$HOME/tmp/conky.kube.sh" # choose a temporary file, preferably in a tmpfs

if [[ $1 == "int" ]]; then
    kubeconfig_file=$HOME/.kube/kubeconfig-ctp-admin
    tmp=$tmp"-int"
elif [[ $1 == "val" ]]; then
    kubeconfig_file=$HOME/.kube/kubeconfig-ctp-val-admin
    tmp=$tmp"-val"
fi

KUBECONFIG=${kubeconfig_file} kubectl get pods | 
awk '
    $3 ~ /Running|Completed/ {
        printf "'"$green"''"$col1"'%s'"$col2"'%s'"$ok_color"''"$col3"'%s'"$black"''"$col4"'%s'"$col5"'%s\n", $1,$2,$3,$4,$5;
    }
    $3 !~ /Running|Completed/ {
        if (NR > 1)
            printf "'"$red"''"$col1"'%s'"$col2"'%s'"$col3"'%s'"$col4"'%s'"$col5"'%s'"$black"'\n", $1,$2,$3,$4,$5;
        else
            printf "'"$col1"'%s'"$col2"'%s'"$col3"'%s'"$col4"'%s'"$col5"'%s\n", $1,$2,$3,$4,$5;
    }
' > $tmp
cat $tmp
