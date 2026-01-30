#!/bin/bash

tr -s ' ' '\n' < input.txt | tr 'A-Z' 'a-z' | grep '^[aeiou]\+$' > vowels.txt
tr -s ' ' '\n' < input.txt | grep '^[bcdfghjklmnpqrstvwxyz]\+$' > consonants.txt
tr -s ' ' '\n' < input.txt | grep '^[bcdfghjklmnpqrstvwxyz][a-z]*[aeiou][a-z]*' > mixed.txt
