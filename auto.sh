#!/bin/bash 
 COUNTER=0
while [  $COUNTER -lt 5 ]; do
kill $(pgrep telegram-cli)
./start.sh
sleep 1
#let COUNTER=COUNTER+1 
done
