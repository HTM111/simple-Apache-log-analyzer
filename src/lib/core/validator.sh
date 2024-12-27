#!/bin/bash
source ./src/lib/utils/logger.sh
validate_input(){
    checkFile "$filename"
    if [ "$pattern" == "CLF" ] ;then
         . ./src/lib/utils/const.sh
          format="$CLF"
    else
         ErrorLogger "The format '$pattern' is not supported "
    fi
}
