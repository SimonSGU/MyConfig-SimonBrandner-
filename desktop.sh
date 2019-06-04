#!/bin/bash
for (( i = 0; i < 4000; i++ )); do
	wmctrl -c plasma
	echo $i
done
