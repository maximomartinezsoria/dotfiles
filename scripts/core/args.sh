#!/usr/bin/env bash

function args_total_is() {
  total_expected="${1}"
  arguments="${*:2}"

  total_arguments=$(echo "$arguments" | wc -w)

  [[ $total_arguments -eq $total_expected ]]
}

function args_has_no_args() {
  args_total_is 0 "$@"
}
