#!/bin/bash

COUNTPKG=$(trizen -Qqu -a | wc -l)

if [ "$COUNTPKG" -gt 0 ]; then
	echo " $COUNTPKG"
fi
