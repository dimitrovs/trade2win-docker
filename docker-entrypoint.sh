#!/bin/bash
sleep 10
chown yo:yo -R /home/yo
cd /home/yo/app
sudo -H -E -u yo python db_create.py
sudo -H -E -u yo python db_migrate.py
sudo -H -E -u yo python db_upgrade.py
sudo -H -E -u yo python run.py &
sudo -H -E -u yo npm install
sudo -H -E -u yo grunt server
