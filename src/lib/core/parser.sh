#!/bin/bash
source ./src/lib/utils/logger.sh
source ./src/lib/core/command.sh

parse_logs(){
    awk -v regex="^$IP_REGEX[[:space:]]$IP_REGEX[[:space:]]$CLIENTID[[:space:]]$DATE_REGEX[[:space:]]$URL_REGEX[[:space:]]$HTTPRES_REGEX[[:space:]]$DATASIZE_REGEX[[:space:]]$HTTPS_URL[[:space:]]$USERAGENT_REGEX$" 'BEGIN{ }''$0 ~ regex {
        if match()


        } '   "$1"
}

# total_requests(){
#     local counter=0
#     linecounter=$(wc -l $1| cut -d " " --fields=1  )
#     MessageLogger "Total Request are : $linecounter"
#
# }
