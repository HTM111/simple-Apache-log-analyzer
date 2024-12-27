#!/bin/bash

source ./src/lib/utils/file.sh
source ./src/lib/core/parser.sh
source ./src/lib/core/validator.sh

main() {
    filename="$1"
    parseArguments "$@"
    validate_input
    parse_logs "$filename"

}

main "$@"
