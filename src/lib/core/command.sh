#!/bin/bash
invalidCommandPrinter() {
    fileOperand=$1
    echo "Missing File Operand!!"
    echo "Try 'ala --help' for more informations."
}
helpCommand(){
    echo "Example usage : ala -f logs.txt -p [pattern]"
}
parseArguments(){
    while getopts "i:p:" opt; do
        case $opt in
        i)
            filename="$OPTARG"
        ;;
        p)
            pattern="$OPTARG"
        ;;
        esac
    done
    if [ -z "$filename" ];then
        echo "Error: -i input file is required."
        exit 1
    fi
    if [ -z "$pattern" ];then
        echo "Error: -p pattern is required."
        exit 1
    fi
}
