#!/bin/bash

ci_start() {
  echo -e "\e[0Ksection_start:$(date +%s):${1}\r\e[0K${1}"
}

ci_end() {
  echo -e "\e[0Ksection_end:$(date +%s):${1}\r\e[0K"
}

ci_section() {
  local _SECTION=$1
  shift
  ci_start "${_SECTION}"
  "${@}"
  ci_end "${_SECTION}"
}

ci_check_test_helpers() {
  if grep -nr '^[^#]*exclude' ./*/test/test_helper.exs ; then
    echo "Some test_helper.exs exclude tests. Please use ./test_helper.exs"
    return 1
  else
    return 0
  fi
}
