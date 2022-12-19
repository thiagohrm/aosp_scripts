#!/bin/bash -el
echo "++++++++++++++ Generating changelog+++++++++++++++++++++"
if [[ ! -e changelog.txt ]]; then       #check if changelog.txt file doesn't exists.
    touch changelog.txt
fi
true > changelog.txt
echo $'\n\n' >> changelog.txt
repo forall -c "git log --pretty=email --since='24 hours ago' >> changelog.txt"
