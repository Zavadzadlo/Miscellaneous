#!/bin/bash

# Checks the springmvctest app on OpenShift and waits till it is really accessible so that the app never become idle

URL_STRING='springmvctest-zavadzadlo.rhcloud.com/app/greet'
SUBSTRING='Greet'

content=$(curl -L $URL_STRING)

for i in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
do
    if [[ $content == *$SUBSTRING* ]]
    then
      echo "not idle: " `date` >> ~/Desktop/openshiftIdlePreventer.txt
      echo -e "" >> ~/Desktop/openshiftIdlePreventer.txt
      exit 0;
    fi

    echo "idle: " + `date` >> ~/Desktop/openshiftIdlePreventer.txt
    echo "retry in 20 seconds" >> ~/Desktop/openshiftIdlePreventer.txt
    sleep 20; # in seconds
    content=$(curl -L $URL_STRING)
done
