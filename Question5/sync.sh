#!/bin/bash

echo "Files only in dirA:"
comm -23 <(ls dirA | sort) <(ls dirB | sort)

echo "Files only in dirB:"
comm -13 <(ls dirA | sort) <(ls dirB | sort)

echo "Common files comparison:"
for file in $(comm -12 <(ls dirA | sort) <(ls dirB | sort)); do
    if cmp -s dirA/$file dirB/$file; then
        echo "$file : SAME"
    else
        echo "$file : DIFFERENT"
    fi
done
