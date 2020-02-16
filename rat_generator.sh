#!/bin/bash

# This bash script generates a file called rats.txt and writes
# 500 100-character lines with randomly generated R's, A's,
# T's, and X's. We can then use count_the_rats.sh to count how
# many rats were generated inside the file.

newfile="rats.txt"

delete_or_exit=0

if [ -s $newfile ]; then
    while [[ $delete_or_exit != "d" ]] && [[ $delete_or_exit != "e" ]]; do
        echo "$newfile exists. (d)elete or (e)xit?"
        read delete_or_exit
    done
    if [ $delete_or_exit == "d" ]; then
        rm $newfile
    else
        exit
    fi
fi

i=0
char_count=0

while [[ $i -lt 500 ]]
do
    randnum=$(shuf -i 0-3 -n 1)
    if [[ "$randnum" -eq 0 ]]; then
        echo -n "R" >> $newfile
    elif [[ "$randnum" -eq 1 ]]; then
        echo -n "A" >> $newfile
    elif [[ "$randnum" -eq 2 ]]; then
        echo -n "T" >> $newfile
    elif [[ "$randnum" -eq 3 ]]; then
        echo -n "X" >> $newfile
    fi
    ((char_count++))
    if [[ "$char_count" -eq 100 ]]; then
        echo >> $newfile
        ((char_count=0))
        ((i++))
    fi
done

