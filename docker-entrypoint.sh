#!/bin/bash

chown yo:yo -R /home/yo
cd /home/yo/app
sudo -H -E -u yo ./install.sh
sudo -H -E -u yo flask/bin/python run.py &
sudo -H -E -u yo npm install
sudo -H -E -u yo grunt server
