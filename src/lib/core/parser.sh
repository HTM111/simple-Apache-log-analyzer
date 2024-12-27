#!/bin/bash
source ./src/lib/utils/logger.sh
source ./src/lib/core/command.sh

parse_logs(){
    line="$0"
    lineCounter=0

    awk -v regex="^$IP_REGEX[[:space:]]$IP_REGEX[[:space:]]$CLIENTID[[:space:]]$DATE_REGEX[[:space:]]$URL_REGEX[[:space:]]$HTTPRES_REGEX[[:space:]]$DATASIZE_REGEX[[:space:]]$HTTPS_URL[[:space:]]$USERAGENT_REGEX$" 'BEGIN{ }''$0 ~ regex {
        line=$0
        lineLength=length($0)
        match(line,/'$IP_REGEX'[[:space:]]'$IP_REGEX'[[:space:]]/)
        Ips=substr(line,RSTART,RLENGTH)
        split(Ips,ip_address," ")
        firstIp = ip_address[1]
        secondIp =ip_address[2]
        print "FIRST IP " firstIp
        print "Second Ip "secondIp
        line=substr(line,RLENGTH+RSTART,lineLength)
        match(line,/'$CLIENTID'[[:space:]]/)
        line=substr(line,RLENGTH+RSTART,lineLength)
        match(line,/'$DATE_REGEX'/)
        print "DATE : " substr(line,RSTART,RLENGTH)
        line=substr(line,RLENGTH+RSTART,lineLength)
        match(line,/\"((GET|POST|PUT|PATCH|DELETE|OPTIONS)[[:space:]][^ ]+[[:space:]]HTTP\/(1.[0-9]|2))\"/)
        print "URL : " substr(line,RSTART,RLENGTH)
        line=substr(line,RLENGTH+RSTART,lineLength)






        } '   "$1"
}

# total_requests(){
#     local counter=0
#     linecounter=$(wc -l $1| cut -d " " --fields=1  )
#     MessageLogger "Total Request are : $linecounter"
#
# }
