#!/bin/bash

mkdir -p $1/backup

for file in $1/*; do
    if [ -f "$file" ]; then
        mv "$file" "$1/backup/" &
        echo "Moved $file with PID $!"
    fi
done

wait
echo "All background jobs completed"
