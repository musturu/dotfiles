#!/bin/bash

# Fetch weather data
weather_data=$(curl -s wttr.in?format=j1)

# Function to get the appropriate icon
get_weather_icon() {
    local description=$(echo "$1" | tr '[:upper:]' '[:lower:]')
    
    if [[ "$description" == *"thunder"* ]]; then
        echo "⛈️"  # Thunderstorm
    elif [[ "$description" == *"snow"* ]]; then
        if [[ "$description" == *"heavy"* ]]; then
            echo "❄️"  # Heavy snow
        else
            echo "🌨️"  # Light snow
        fi
    elif [[ "$description" == *"sleet"* ]]; then
        echo "🌨️"  # Sleet
    elif [[ "$description" == *"rain"* || "$description" == *"shower"* ]]; then
        if [[ "$description" == *"light"* ]]; then
            echo "🌦️"  # Light rain or showers
        else
            echo "🌧️"  # Heavy rain or showers
        fi
    elif [[ "$description" == *"drizzle"* ]]; then
        echo "🌦️"  # Drizzle
    elif [[ "$description" == *"fog"* || "$description" == *"mist"* ]]; then
        echo "🌫️"  # Fog or mist
    elif [[ "$description" == *"cloud"* ]]; then
        if [[ "$description" == *"partly"* ]]; then
            echo "⛅"  # Partly cloudy
        else
            echo "☁️"  # Cloudy
        fi
    elif [[ "$description" == *"clear"* || "$description" == *"sunny"* ]]; then
        echo "☀️"  # Clear or sunny
    else
        echo "❓"  # Unknown condition
    fi
}

# Check if curl command was successful
if [ $? -eq 0 ]; then
    # Parse JSON data using jq (make sure jq is installed)
    weather=$(echo "$weather_data" | jq -r '.current_condition[0].weatherDesc[0].value')

    # Get and output the weather icon
    get_weather_icon "$weather"
    # echo "$weather_icon" 
	exit 0
else
    echo "Error: Failed to fetch weather data" >&2
	exit -1
fi
