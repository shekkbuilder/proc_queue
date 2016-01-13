#!/bin/bash
#trap '[ -z $! ] || kill $!' SIGHUP SIGINT SIGQUIT SIGTERM
for pid in $(cat pids.1); 
do
	kill -19 $pid
done

for pid in $(cat pids.1);
do
	kill -18 $pid
	while [[ -e /proc/$pid ]];
		do
			echo -n ".";
			sleep 30;
		done
done
