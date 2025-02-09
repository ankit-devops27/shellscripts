#!/bin/bash

## add city name for wheather

city=Casablanca

#download the weather report for city

curl -s wttr.in/$city?T --output weather_report

#Fetch the current temprature from weather report file

obs_temp=$(curl -s wttr.in/$city?T| grep -m 1 '°.'|grep -Eo -e '-?[[:digit:]].*')
echo "current temprature of $city is $obs_temp"


# To extract the forecast tempearature for noon tomorrow
fc_temp=$(curl -s wttr.in/$city?T | head -23 | tail -1 | grep '°.' | cut -d 'C' -f2 | grep -Eo -e '-?[[:digit:]].*')
echo "The forecasted temperature for noon tomorrow for $city : $fc_temp C"


#Assign Country and City to variable TZ
TZ='Morocco/Casablanca'


# Use command substitution to store the current day, month, and year in corresponding shell variables:
day=$(TZ='Morocco/Casablanca' date -u +%d) 
month=$(TZ='Morocco/Casablanca' date +%m)
year=$(TZ='Morocco/Casablanca' date +%Y)

record=$(echo -e "$year\t$month\t$day\t$obs_temp\t$fc_temp C")
echo $record>>rx_poc.log

cat rx_poc.log
