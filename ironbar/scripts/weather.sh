#!/bin/bash

# Fetch weather data
weather_data=$(curl -s wttr.in?format=j1)
# Function to get the appropriate icon
get_weather_icon() {
    case $1 in
        "Sunny" | "Clear")
            echo "☀️"
            ;;
        "Partly cloudy")
            echo "⛅"
            ;;
        "Cloudy" | "Overcast")
            echo "☁️"
            ;;
        "Rain" | "Light rain" | "Heavy rain" | "Moderate rain")
            echo "🌧️"
            ;;
        "Thunderstorm" | "Thunder")
            echo "⛈️"
            ;;
        "Snow" | "Light snow" | "Heavy snow")
            echo "❄️"
            ;;
        "Fog" | "Mist")
            echo "🌫️"
            ;;
        "Windy")
            echo "💨"
            ;;
        *)
            echo "❓"
            ;;
    esac
}

# Check if curl command was successful
if [ $? -eq 0 ]; then
    # Parse JSON data using jq (make sure jq is installed)
    city=$(echo "$weather_data" | jq -r '.nearest_area[0].areaName[0].value')
    weather=$(echo "$weather_data" | jq -r '.current_condition[0].weatherDesc[0].value')
    weather_icon=$(get_weather_icon "$weather")
    temp=$(echo "$weather_data" | jq -r '.current_condition[0].temp_C')


    # Output the results
    echo "City: $city"
    echo "Weather: $weather"
    echo "Temperature: ${temp}°C"
	exit 0
else
    echo "Error: Failed to fetch weather data" > 2
	exit 1
fi
