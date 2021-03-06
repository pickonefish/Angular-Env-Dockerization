#!/bin/bash
set -e

# Available configuration variables.
declare -A vars=( \
  [optionA]=MYAPP_OPTION_A \
  [optionB]=MYAPP_OPTION_B \
  [optionC]=MYAPP_OPTION_C
)

# Work out which of the available variables have been set.
declare -A varsSet
for var in "${!vars[@]}"; do
  value=${vars[$var]}
  if [[ -v $value ]]; then
    varsSet[$var]=${!value}
  fi
done

keys=(${!varsSet[@]})
lastIndex=$(( ${#varsSet[@]} - 1 ))

# Iterate over the set variables and echo out the corresponding JSON.
echo "{"
for (( i=0 ; i < "${#varsSet[@]}" ; i++ )); do
  key=(${keys[$i]})
  value=(${varsSet[$key]})
  kvPair="  \"$key\": \"$value\""
  # If this is the last variable, don't print out a comma at the end of the
  # line.
  if [[ ! $i -eq $lastIndex ]]; then kvPair+=","; fi
  echo "$kvPair"
done
echo "}"
