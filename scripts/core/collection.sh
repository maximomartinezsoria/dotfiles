#!/usr/bin/env bash

function collection_is_empty() {
  local var=${1}
  [[ -z ${var} ]]
}
