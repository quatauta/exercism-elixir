#!/bin/bash

ci_start() {
    echo -e "\e[0Ksection_start:$(date +%s):${1}\r\e[0K${1}"
}

ci_end() {
    echo -e "\e[0Ksection_end:$(date +%s):${1}\r\e[0K"
}

ci_section() {
    local SECTION=$1
    shift
    ci_start "${SECTION}"
    "${@}"
    ci_end "${SECTION}"
}
