#!/bin/bash

touch web-update-init;

sudo -u pi bash -c 'exec /home/pi/zwiebel/update.sh';

rm web-update-init
