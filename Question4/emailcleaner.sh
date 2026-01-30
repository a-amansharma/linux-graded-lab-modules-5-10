#!/bin/bash

# Extract valid email addresses
grep -E '^[a-zA-Z0-9_]+@[a-zA-Z]+\.com$' emails.txt > valid.txt

# Remove duplicate valid emails
sort valid.txt | uniq > temp.txt
mv temp.txt valid.txt

# Extract invalid email addresses
grep -Ev '^[a-zA-Z0-9_]+@[a-zA-Z]+\.com$' emails.txt > invalid.txt
