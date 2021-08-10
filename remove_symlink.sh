#!/bin/sh
dots=$(ls -d */ | grep -v ^_)
for dot in $dots
do
	stow -D $dot
done
