#!/bin/sh
cd ~/.dotfiles/.config/;/usr/bin/ls -d */ | xargs -I {} rm -rf ~/.config/{}
cd ~/.dotfiles/.home/;/usr/bin/ls -d */ | xargs -I {} rm -rf ~/.home/{}
