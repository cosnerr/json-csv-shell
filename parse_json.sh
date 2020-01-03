#!/bin/zsh

###################################### VARIABLES ########################
FILE="$1"
COL1="$2"
COL2="$3"
KEY=$(cat "$FILE" | jq -r 'keys | .[]')

###################################### MAIN #############################
cat "$FILE" | jq -rc '."'"$KEY"'"[] | [."'"$COL1"'",(."'"$COL2"'" | todate)] | @csv' | sort -rk 2 -t , | awk -v var="$FILE" -F',' 'BEGIN{OFS=","} {print NR, var, $0}' 

