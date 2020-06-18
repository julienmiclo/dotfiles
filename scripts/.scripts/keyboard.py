#!/usr/bin/env python

import sys
import subprocess

def fix_string(string):
    if sys.version_info.major == 3:
        return string
    else:
        return string.encode('utf-8')

output = ''
keyboard_name = "dev-keyboard-julien"
icon = fix_string(u'\uf05e,\uf11c').split(',')
keyboard_id = fix_string(subprocess.check_output("xinput -list | grep \""+keyboard_name+"\" | awk -F'=' '{print $2}' | cut -c 1-2 | head -1",shell=True,stderr=subprocess.STDOUT)).rstrip()

if keyboard_id :
    output = icon[1]
else:
    output = icon[0]

print(output)
