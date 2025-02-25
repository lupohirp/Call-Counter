#!/bin/bash

API_URL="<API_URL>"

total_requests=0
status_codes=()

function finish {
   # Colour codes
    RED='\033[0;31m'
    GREEN='\033[0;32m'
    NC='\033[0m'

    echo "Script terminated. Calculating status code percentages..."
    for code in "${!status_codes[@]}"; do
        percentage=$(echo "scale=2; ${status_codes[$code]} / $total_requests * 100" | bc)
        if [ $code -eq 200 ]; then
            echo -e "Status code: ${GREEN}$code${NC} - ${status_codes[$code]} requests - $percentage%"
        else
            echo -e "Status code: ${RED}$code${NC} - ${status_codes[$code]} requests - $percentage%"
        fi
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
