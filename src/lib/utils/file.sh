#!/bin/bash
source ./src/lib/utils/logger.sh

isEmpty(){
    input=$1
    if [ -z "$input" ];then
        WarningLogger "Invalid Input the input is null"
    fi
}
checkFile(){
    FILE=$1
    isEmpty $FILE
    if [ ! -e "$FILE" ];then
        ErrorLogger "File \"$1\" Doesn't Exist"
    elif [ -d "$FILE" ]; then
        ErrorLogger "File \"$1\" is a directory"
    elif [ ! -s "$FILE" ];then
        WarningLogger "File \"$1\" is Empty"
     fi

}
