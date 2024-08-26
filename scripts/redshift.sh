#!/bin/bash

while : ; do
    redshift -P -O 4000 &>/dev/null
    sleep 10
done &
