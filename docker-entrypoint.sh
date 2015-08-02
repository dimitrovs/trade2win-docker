#!/bin/bash

echo "yo:$SSH_PASSWORD"|chpasswd
/etc/init.d/dropbear start
chown yo:yo -R /home/yo
cd /home/yo/app
LD_LIBRARY_PATH=/usr/local/lib/ sudo -u yo ./install.sh
LD_LIBRARY_PATH=/usr/local/lib/ sudo -u yo flask/bin/python run.py &
sudo -u yo npm install
sudo -u yo grunt server
#sudo -u yo /bin/bash
#dropbear -F
