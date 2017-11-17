#!/bin/bash


# Author: Pratik Anand
# Author Email: anandpratik141@gmail.com



die() { echo -e "\e[31m$@\e[0m" 1>&2 ; exit 1; }

info_n() { echo -e "\e[36m$@\e[0m" 1>&2 ; }

info() { echo "" ; info_n $* ; }

warn() { echo ""; echo -e "\e[33m$@\e[0m" 1>&2; }

exit_on_error() {
 [ $? -eq 0 ] || die "ERROR: $1" 
}


echo info
info "Log:: Info"

echo info_n
info_n "Log:: info no new line"

echo warn
warn "Log:: warning"

echo die
die "Log:: exist "

