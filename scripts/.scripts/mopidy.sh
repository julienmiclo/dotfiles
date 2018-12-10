#!/usr/bin/env sh

killall -q mopidy

while prgrep -x mopidy >/dev/null; do sleep 1; done

mopidy &
