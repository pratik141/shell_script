#!/bin/bash

# Author: Pratik Anand
# Author Email: anandpratik141@gmail.com

. /lib/lsb/init-functions

log_daemon_msg "hi log_daemon_msg "	
log_warning_msg "log_warning_msg"
log_use_fancy_output "log_use_fancy_outpu"
log_progress_msg "nfsd"
log_end_msg "$?"
