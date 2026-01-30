#!/bin/bash

# Check if exactly one argument is provided
if [ $# -ne 1 ]; then
  echo "Usage: $0 logfile"
  exit 1
fi

# Check if file exists and readable
if [ ! -r "$1" ]; then
  echo "Error: File does not exist or is not readable."
  exit 1
fi

# Count total log entries
total=$(wc -l < "$1")

# Count log levels
info=$(grep -c " INFO " "$1")
warning=$(grep -c " WARNING " "$1")
error=$(grep -c " ERROR " "$1")

# Get most recent error
recent_error=$(grep " ERROR " "$1" | tail -1)

# Create report
date=$(date +%F)
report="logsummary_$date.txt"

echo "Total entries: $total" > "$report"
echo "INFO messages: $info" >> "$report"
echo "WARNING messages: $warning" >> "$report"
echo "ERROR messages: $error" >> "$report"
echo "Most recent ERROR:" >> "$report"
echo "$recent_error" >> "$report"

cat "$report"

