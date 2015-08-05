#!/bin/bash +x

# Multiloggen.sh @2015 Rob Thatcher

# Demo log message file generator, will create a log file with 10 lines of 8 byts of dev/random in each message with a random time
# between 1 and 10 seconds between each line, output to a file defined in $LOGFILE variable before moving rotating that file and repearing. 
# The default config of this script will create 20 of these small log files.

# Adjusting the iterations / randomise time / counter can make this a very LONG running scripts, perfect for testing housekeeping/monitoring etc..


LOGFILE=fxf.log
COUNTER=0
ITERATIONCOUNT=0

while [  $ITERATIONCOUNT -lt 20 ]; do				# Adjust num of files created by changing the 'lt' value here
	let ITERATIONCOUNT=ITERATIONCOUNT+1

	while [  $COUNTER -lt 10 ]; do				# Adjust num of lines in each log file by changing 'lt' value here
		let COUNTER=COUNTER+1 
		rnd1=`echo $RANDOM % 10 + 1 | bc`		# Adjust random wait time between lines here
		PAYLOAD=`cat /dev/random | head -c 8`
		echo "`date +%s` tenmessagegen : $PAYLOAD : Time to next message : $rnd1" >> $LOGFILE
		sleep $rnd1
	done

	COUNTER=0
 
	if [ ! -f $LOGFILE ]; then
		echo "log file not found $LOGFILE"
		exit 1
	fi
	cp $LOGFILE $LOGFILE.$ITERATIONCOUNT
	rm $LOGFILE
done
