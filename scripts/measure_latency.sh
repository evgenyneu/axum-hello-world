#!/bin/bash

# Number of requests
NUM_REQUESTS=10

# Target URL
URL="http://192.168.20.24:3000"

echo "Starting latency test for $URL"
echo "Running $NUM_REQUESTS requests..."
echo "----------------------------------------"

for i in $(seq 1 $NUM_REQUESTS); do
    echo "Request $i:"
    curl -w "\nTime details:\n"\
         -w "DNS lookup:    %{time_namelookup}s\n"\
         -w "TCP connect:   %{time_connect}s\n"\
         -w "Total time:    %{time_total}s\n"\
         -o /dev/null -s $URL
    echo "----------------------------------------"
    # Small delay between requests
    sleep 0.5
done
