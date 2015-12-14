#!/bin/bash
# @author Howard Edwards
# google.sh ~ Using Google's search engine to perform a web search or to open a web address directly
# Conversion of google.bat to a shell script
# Usage: google.sh <query> (on Windows)

# Checking if the number of command line arguments < 1
if [ "$#" -lt 1 ]; then
    echo "Usage:: google.sh <query>"
    exit
fi

# Checking if the # of command line arguments is >= 1
if [[ "$#" -ge 1 ]]; then

	# Check if # of command line arguments = 1
	if [[ "$#" -eq 1 ]]; then
		QUERY=$1

		# Checks to see if search query contains common top level domain extensions
		if [[ $QUERY == *".com"* ]]; then
			echo ".com"
			start http://www.$QUERY
			exit
		elif [[ $QUERY == *".org"* ]]; then
			echo ".org"
			start http://www.$QUERY
			exit
		elif [[ $QUERY == *".net"* ]]; then
			echo ".net"
			start http://www.$QUERY
			exit
		elif [[ $QUERY == *".gov"* ]]; then
			echo ".gov"
			start http://www.$QUERY
			exit
		elif [[ $QUERY == *".edu"* ]]; then
			echo ".edu"
			start http://www.$QUERY
			exit
		else
			echo "Search Query"
			start http://www.google.com/search?q=$QUERY
			exit
		fi
	else
		QUERY=""

		for searchitem in "$@"
		do
			# Concatenating search query
			QUERY=$QUERY$searchitem+
		done
		start http://www.google.com/search?q=${QUERY::-1}
	fi
fi
exit