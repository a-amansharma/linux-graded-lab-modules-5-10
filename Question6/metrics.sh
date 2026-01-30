#!/bin/bash

words=$(tr -s ' ' '\n' < input.txt)

echo "Longest word:"
echo "$words" | awk '{ print length, $0 }' | sort -nr | head -1 | cut -d" " -f2-

echo "Shortest word:"
echo "$words" | awk '{ print length, $0 }' | sort -n | head -1 | cut -d" " -f2-

echo "Average word length:"
echo "$words" | awk '{ total+=length; count++ } END { print total/count }'

echo "Unique words:"
echo "$words" | sort | uniq | wc -l
