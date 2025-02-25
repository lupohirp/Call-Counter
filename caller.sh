#!/bin/bash

API_URL="<API_URL>"

total_requests=0
status_codes=()

function finish {
    echo "Script terminated. Calculating status code percentages..."
    for code in "${!status_codes[@]}"; do
        percent=$(echo "scale=2; ${status_codes[$code]} * 100 / $total_requests" | bc)
        echo "Status code $code: $percent%"
    done
    exit 0
}

trap finish SIGINT

while true; do
    response=$(curl -s -o /dev/null -w "%{http_code}" $API_URL)
    echo "Response: $response"
    ((total_requests++))
    ((status_codes[$response]++))
done