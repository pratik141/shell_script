#!/bin/bash

# Author: Pratik Anand
# Author Email: anandpratik141@gmail.com

start() {

	echo 'service Started'
}

stop() {

	echo 'service Stopped'
}

restart() {

	echo 'Killing open port'
	echo 'Retarting service'

}


case $1 in
	
	start|stop)
		$1
	;;
	
	restart)
		$1
	;;
	*)
		echo "Run as $0 <start|stop|restart>"
		exit 1
	;;
esac
