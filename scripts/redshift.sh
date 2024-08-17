#!/bin/bash

while : ; do
    redshift -P -O 2800 &>/dev/null
    sleep 10
done &
