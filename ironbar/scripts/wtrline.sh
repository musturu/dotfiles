#!/bin/bash
# Fetch the weather report for the whole day
weather_report=$(curl -s wttr.in | sed -n '8,17p')
# Check if curl command was successful
if [ $? -eq 0 ]; then
    # Remove ANSI color codes, replace spaces with underscores, add explicit \n at the end of each line
    clean_report=$(echo "$weather_report" | 
                   sed 's/\x1B\[[0-9;]*[JKmsu]//g'  | 
                   sed 's/ /\x60/g' |
                   sed 's/$/\\n/' | 
                   tr -d '\n')
    echo -e "$clean_report"
	exit 0
else
    echo "Error: Failed to fetch weather data"
	exit 1
fi
