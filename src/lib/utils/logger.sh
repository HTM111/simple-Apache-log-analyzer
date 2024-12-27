#!/bin/bash
MessageLogger(){
    echo -e "\e[32m [INFO] $1\e[0m"
}
ErrorLogger(){
    echo -e "\e[31m[ERROR] \e[31m$1\e[0m"
    exit 1
}
WarningLogger(){
    echo -e "\e[33m[Warning] $1\e[0m"
}
