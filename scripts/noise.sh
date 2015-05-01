#!/bin/bash

# Requires adaptations...
# But will generate a logfile entry in sequential order every second, log payload needs padding (TBD)

Tstart=$(date +%s)
let Tend=$Tstart+1000

[ -e noise.log ] && rm noise.log

for (( Tloop=Tstart; Tloop <=Tend; Tloop++ ))
do
    echo @$Tloop >> noise.log 
done

