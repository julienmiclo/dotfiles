#!/bin/bash

API_KEY="30605033493879097eecc242aadc020e"
SYMBOL_CELSIUS="°C"
LANG="fr"
UNIT="metric"
URL="http://api.openweathermap.org/data/2.5/weather"

if ping -c 1 176.34.131.233 &> /dev/null; then

	IP=$(curl -s http://whatismyip.akamai.com/)

	# Get longitude and latitude based on ip
	GEO_LOCATION=$(jq -r '.loc' <<< $(curl -s "ipinfo.io/${IP}"))
	IFS=',' read -ra LONGLAT <<< "$GEO_LOCATION"
	LAT="${LONGLAT[0]}"
	LON="${LONGLAT[1]}"

	WEATHER_URL="${URL}?lat=${LAT}&lon=${LON}&appid=${API_KEY}&units=${UNIT}&lang=${LANG}"
	WEATHER=$(curl -s $WEATHER_URL)
	WEATHER_MAIN=$(echo $WEATHER | jq -r '.weather | map(.main) | join("/")')
	WEATHER_CODE=$(echo $WEATHER | jq -r '. | "\(.weather[0].icon)"')
	WEATHER_TEMP=$(echo $WEATHER | jq -r '. | "\(.main.temp)"' | cut -d'.' -f1)

	case $WEATHER_CODE in
		01d) icon=;;
		01n) icon=;;
		02d) icon=;;
		02n) icon=;;
		03*) icon=;;
		04*) icon=;;
		09*) icon=;;
		10*) icon=;;
		11*) icon=;;
		13*) icon=;;
		50*) icon=;;
		*) icon=;;
	esac

	WEATHER_ICON="${icon}"

	echo "%{T3}${WEATHER_ICON}%{T-} ${WEATHER_MAIN}, ${WEATHER_TEMP}${SYMBOL_CELSIUS}"
else
	echo "waiting..."
fi
