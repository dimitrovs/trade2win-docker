#!/bin/bash

chown yo:yo -R /home/yo
cd /home/yo/app
sudo -E -u yo ./install.sh
sudo -E -u yo flask/bin/python run.py &
sudo -E -u yo npm install
sudo -E -u yo grunt server
