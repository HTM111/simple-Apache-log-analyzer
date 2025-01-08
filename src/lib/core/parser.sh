#!/bin/bash
source ./src/lib/utils/logger.sh
source ./src/lib/core/command.sh

parse_logs(){
    counter=0
    perl ./src/lib/core/parser/parser.pl "$1"

}
