#!/bin/bash

# Terminate already running notification instances
pidof dunst && killall dunst

# Wait untile the processes have been shut down
while pgrep -x dunst >/dev/null; do sleep 1; done

# Launch dunst
dunst &
