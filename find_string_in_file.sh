#!/bin/bash
# arg1: filename_to_parse
# arg2: search_string
# Simple bash script that counts how many times a string
# is found in a file, including when it falls across
# multiple lines.


if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <file-to-search> <string-to-search-for>"
    exit    
fi

file_to_search=$1
search_string=$2
regex_search_string=$(echo $search_string | sed 's/./&\(\\n\)\?/g')

echo
echo "Searching $file_to_search for $search_string"
echo

string_count=$(cat $1 | pcregrep -Mc $regex_search_string)

echo "$search_string was found $string_count times in $1"
echo
