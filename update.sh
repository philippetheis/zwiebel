#!/bin/bash

#zwiebel
#update.sh fuer system und anschliessend zwiebel
#2013-06-26 v0.1

datum=$(date +%s);
current=$(pwd);

cd /home/pi/zwiebel;
echo "fuehre update durch";
#echo "$(date +%s):">>update.log;
touch update-init;
#|tee -a update.log;

echo "$(date +%s):">>update.log;
sudo apt-get update;
#|tee -a update.log;

echo "$(date +%s):">>update.log;
echo "fuehre system-upgrade durch"|tee -a update.log;
sudo apt-get upgrade -y
#|tee -a update.log;

cd ~;
#echo "lade update ueber git herunter";

#cd zwiebel-$datum;
echo "starte Aktualisierung ueber git";
cd /home/pi/zwiebel;
git pull;
sudo -u pi bash -c 'cd /home/pi/zwiebel/; sh git-update.sh;';

#wechsle in alten update ordner
#cd $current;
#echo "$(date +%s):">>update.log;
rm update-init|tee -a update.log;

echo "update beendet";
