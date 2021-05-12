#!/bin/bash

col1='${goto 40}'
col2='${goto 140}'
col3='${goto 380}'
col4='${goto 530}'
col5='${goto 660}'
col6='${goto 940}'
red='${color red}'
black='${color black}'
green='${color green}'

# the next line is configurable
tmp="$HOME/tmp/conky.docker.sh" # choose a temporary file, preferably in a tmpfs

docker ps -a --format "{{.ID}}|{{.Image}}|{{.Names}}|{{.Networks}}|{{.Ports}}|{{.State}}" |
awk '
    BEGIN {
    FS="|"
    printf "'"$col1"'%s'"$col2"'%s'"$col3"'%s'"$col4"'%s'"$col5"'%s'"$col6"'%s\n","ID","Image","Name","Networks","Ports","State";
    }
    $2 ~ /^docker/ {
        n=split($2,image,"/")       
        line=format_line($1,image[n],$3,$4,$5,$6)
    }
    $2 !~ /^docker/ {
        line=format_line($1,$2,$3,$4,$5,$6)
    }
    $6 ~ /running/ {
        printf "'"$green"'%s'"$black"'",line
    }
    $6 !~ /running/ {
        printf "'"$red"'%s'"$black"'",line
    }

function format_line(id,image,names,networks,ports,state) {
    _line=""
    gsub(/ /,"",ports)
    n=split(ports,ports_list,",")
    
    if (n > 1) {
        i = 1
        middle = int(n / 2)
        while (i <= n) {
            if ( i == 1 ) {
                _line=sprintf("'"$col5"'%s\n",ports_list[i])
            } else {
                if (i < middle || i > middle) {
                    _line=sprintf("%s'"$col5"'%s\n",_line,ports_list[i])
                } else {
                    _line=sprintf("%s'"$col1"'%s'"$col2"'%s'"$col3"'%s'"$col4"'%s'"$col5"'%s'"$col6"'%s\n",_line,id,image,names,networks,ports_list[i],state)
                }
            }
            i++ 
        }
        return _line
    }
    return sprintf("'"$col1"'%s'"$col2"'%s'"$col3"'%s'"$col4"'%s'"$col5"'%s'"$col6"'%s\n",id,image,names,networks,ports,state)
}
' > $tmp
cat $tmp
