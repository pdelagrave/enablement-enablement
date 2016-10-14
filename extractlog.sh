#!/bin/bash

cat $1 | jq .timestamp | cut -d'.' -f1 | xargs date -r

HASH="{$(cat $1 | jq .message | cut -d'{' -f2- | sed 's/\\"/\"/g')"

HASH=${HASH:0:$(expr ${#HASH} - 1)}

ruby -e "require 'pp'; stacktrace=$HASH; pp stacktrace"

