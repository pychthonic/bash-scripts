# !/bin/bash
# arg1: filename_to_parse
# arg2: search_string
# Bash script that counts how many times a string
# is found in a file, including when it falls across
# multiple lines.
# Depends on pcregrep -- if it's not installed on
# your system, you have the option of letting the
# bash script installing it for you.


if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <file-to-search> <string-to-search-for>"
    exit    
fi

hash pcregrep &> /dev/null

if [ $? -ne 0 ]; then
    echo "Dependancy not found: pcregrep."
    yes_or_no=0
    while [[ $yes_or_no != "y" ]] && [[ $yes_or_no != "n" ]]; do
        echo "Install pcregrep with package manager? (y)es or (n)o: "
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
            sudo yum install pcregrep
        elif [ $DistroBasedOn == "Debian" ]; then
            sudo apt install pcregrep
        fi 

    else
        exit
    fi
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
