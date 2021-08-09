#!/bin/sh
reqs=$(cat ./requirements.txt)
yay -S $reqs --noconfirm
