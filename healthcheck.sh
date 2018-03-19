#!/bin/sh
content=$(cat health)
up="up"
if [ "$up" == "$content" ];then
    exit 0
fi
exit 1