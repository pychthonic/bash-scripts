#!/bin/bash
# arg1: filename_to_parse
# arg2: search_string
# Simple bash script that counts how many times a string
# is found in a file, including when it falls across
# multiple lines.
# Tested successfully on Ubuntu 19.10 and Centos 7.

hash pcre2grep &> /dev/null

if [ $? -ne 0 ]; then
    echo "Dependancy not found: pcre2grep."
    yes_or_no=0
    while [[ $yes_or_no != "y" ]] && [[ $yes_or_no != "n" ]]; do
        echo "Install pcre2grep with package manager?"
        echo "Note: requires sudo access. You will be asked for your password. "
        read yes_or_no
    done
    if [ $yes_or_no == "y" ]; then
        OS=$(uname)
        if [ $OS == "Linux" ]; then
            if [ -f /etc/redhat-release ]; then
                DistroBasedOn="RedHat"
            elif [ -f /etc/debian_version ]; then
                DistroBasedOn="Debian"
            else
                echo "Failed to determine Linux distro. Exiting."
                exit
            fi
        else
            echo "Sorry, this bash script was written for Redhat- and Debian- based Linux distros. Exiting."
            echo
            exit
        fi
        if [ $DistroBasedOn == "RedHat" ]; then
            sudo yum install pcre2-tools
        elif [ $DistroBasedOn == "Debian" ]; then
            sudo apt install pcre2-utils
        fi
    else
        exit
    fi
fi

file_to_search="rats.txt"
search_string="RAT"
regex_search_string=$(echo $search_string | sed 's/./&\(\\n\)\?/g')

#sed -r "s/^GATTACA//g" $file_to_search

string_count=$(cat $file_to_search | pcre2grep -M --line-offsets $regex_search_string | wc -l)

echo
echo "$search_string was found $string_count times in $file_to_search."
echo



