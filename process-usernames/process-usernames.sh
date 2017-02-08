#!/bin/bash


if [[ "$1" = "" ]]; then
    FILE=/dev/stdin
else
    FILE="$1"
fi

while read line; do
    # echo "$line"
    username=$(echo "$line" | sed 's/.*\([0-9]\{6\}\).*/\1/')
    if [ "$username" = "$line" ]; then
        echo "$line"
    else
        realname=`grep "^$username" "humans" | cut -d" " -f 3-`
        echo "$line ($realname)"
    fi
done < "$FILE"
