#!/bin/bash

ci_section_begin() {
    SECTION="$1"
    DESCRIPTION="$2"
    echo -e "\e[0Ksection_start:$(date +%s):${SECTION}\r\e[0K${DESCRIPTION:-$SECTION}"
}

ci_section_end() {
    SECTION="$1"
    echo -e "\e[0Ksection_end:$(date +%s):${SECTION}\r\e[0K"
}
