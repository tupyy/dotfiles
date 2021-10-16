#!/bin/bash

offset=$(($1+500))
colID='${goto '"$offset"'}'
colImage='${goto '"$(($offset+140))"'}'
colName='${goto '"$(($offset+440))"'}'
colNetwork='${goto '"$(($offset+668))"'}'
colPorts='${goto '"$(($offset+900))"'}'
colState='${goto '"$(($offset+1150))"'}'
red='${color #fc6c71}'
black='${color black}'
green='${color green}'

# the next line is configurable
tmp="$HOME/tmp/conky.docker.sh" # choose a temporary file, preferably in a tmpfs

docker ps -a --format "{{.ID}}|{{.Image}}|{{.Names}}|{{.Networks}}|{{.Ports}}|{{.State}}" |
awk '
    BEGIN {
    FS="|"
    printf "'"$colID"'%s'"$colImage"'%s'"$colName"'%s'"$colNetwork"'%s'"$colPorts"'%s'"$colState"'%s\n","ID","Image","Name","Networks","Ports","State";
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
        if ( n % 2 != 0 ) {
            middle += 1
        }
        while (i <= n) {
            if (i < middle || i > middle) {
               _line=sprintf("%s'"$colPorts"'%s\n",_line,ports_list[i])
            } else {
               _line=sprintf("%s'"$colID"'%s'"$colImage"'%s'"$colName"'%s'"$colNetwork"'%s'"$colPorts"'%s'"$colState"'%s\n",_line,id,image,names,networks,ports_list[i],state)
            }
            i++ 
        }
        return _line
    }
    return sprintf("'"$colID"'%s'"$colImage"'%s'"$colName"'%s'"$colNetwork"'%s'"$colPorts"'%s'"$colState"'%s\n",id,image,names,networks,ports,state)
}
' > $tmp
cat $tmp
