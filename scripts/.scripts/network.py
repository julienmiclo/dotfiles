#!/usr/bin/env python

import sys
import argparse
import subprocess
import requests

parser = argparse.ArgumentParser()
parser.add_argument(
    '-s',
    '--showip',
    type=int,
    metavar='showip'
)
args = parser.parse_args()

def fix_string(string):
    if sys.version_info.major == 3:
        return string
    else:
        return string.encode('utf-8')

output = ''
icon = fix_string(u'\uf05e,\uf1eb')
ssid_name = ''
show_ip = 0

if args.showip is not None:
    show_ip = args.showip

try:
    ssid_name = fix_string(subprocess.check_output('iwgetid -r',shell=True,stderr=subprocess.STDOUT))
except subprocess.CalledProcessError as e:
   ssid_name = 'off'

icon = icon.split(',')

if ssid_name == 'off':
    output = icon[0]+' '
    if show_ip:
        output += 'no public ip'
    else:
        output += 'wifi off'
else:
    output = icon[1]+' '
    if show_ip:
        output += requests.get('https://ipecho.net/plain').text
    else:
        output += ssid_name.decode('utf-8').split('\n')[0]+' > '+requests.get('https://ipecho.net/plain').text

print(output)
