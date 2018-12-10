#!/bin/bash

COUNTPKG=$(yaourt -Qqu -a | wc -l)

if [ "$COUNTPKG" -gt 0 ]; then
	echo " $COUNTPKG"
fi
