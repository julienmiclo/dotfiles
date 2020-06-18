#!/bin/bash

NAME="Clavier de Merwan"

echo -e 'power on\nconnect 04:DB:56:C9:95:D2 \nquit' | bluetoothctl


KEYBOARD_ID=`xinput -list | grep "${NAME}" | awk -F'=' '{print $2}' | cut -c 1-2`
setxkbmap -device "$KEYBOARD_ID" -layout fr
