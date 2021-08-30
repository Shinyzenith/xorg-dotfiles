#!/bin/bash
echo "Checking for newer files online first"
git pull
git add --all .
echo "Write your commit message!"
read input
git commit -m "$input"
git push
echo "Git Push Done"
