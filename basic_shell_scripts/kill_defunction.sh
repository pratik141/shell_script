#/bin/bash

# Author: Pratik Anand
# Author Email: anandpratik141@gmail.com


ps -ef | grep '<defunct>' | grep -v grep | awk '{print "kill -9 ",$3}' | sh