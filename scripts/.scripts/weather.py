#!/usr/bin/env python

from pprint import pprint
import requests
import re
import subprocess

api_key = '30605033493879097eecc242aadc020e'
symbol_celsius = '°C'
lang = 'fr'
unit = 'metric'
url = 'http://api.openweathermap.org/data/2.5/weather'
icons = {
    '01d': '\uf00d', #clear day
    '01n': '\uf02e', #clear night
    '02d': '\uf002', #cloudy day
    '02n': '\uf086', #cloudy night
    '03.': '\uf041', #cloud
    '04.': '\uf013', #clouds
    '09.': '\uf01a', #showers
    '10.': '\uf019', #rain
    '11.': '\uf01e', #thumderstorm
    '13.': '\uf01b', #snow
    '50.': '\uf014' #mist/fog
}
icon = False
mains = []

try:
    ssid_name = subprocess.check_output('iwgetid -r',shell=True,stderr=subprocess.STDOUT)
except subprocess.CalledProcessError as e:
   ssid_name = 'off'

if ssid_name != 'off':
    ip = requests.get('http://ipecho.net/plain')
    location = requests.get('http://ipinfo.io/'+ip.text)
    location = location.json()
    longlat = location['loc'].split(',')

    payload = {'lat':longlat[0],'lon':longlat[1],'appid':api_key,'units':unit,'lang':lang}

    weather = requests.get(url, params=payload)
    weather = weather.json()

    temp = weather['main']['temp']
    code = weather['weather'][0]['icon']

    for main in weather['weather']:
        mains.append(main['main'])

    for i in icons:
        if re.search(i, code) is not None:
            icon = icons[i]

    if icon == False:
        icon = '\uf084' #umbrella

    print('%{T3}'+icon+'%{T-} '+('/'.join(map(str,mains)))+' '+str(int(float(temp)))+symbol_celsius)
else:
    print('waiting...')
