#!/bin/sh
dots=$(ls -d */)
for dot in $dots
do
	stow -D $dot -t ~/
	stow $dot -t ~/
done
~/.config/bspwm/bspwmrc
