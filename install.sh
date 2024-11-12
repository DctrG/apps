#!/bin/bash

echo "Running startup script..." > /var/log/startup-script.log
git clone https://github.com/DctrG/apps.git
sudo -s
export SSL_CERT_FILE=/etc/ssl/certs/root_ca.pem
export REQUESTS_CA_BUNDLE=/etc/ssl/certs/root_ca.pem
export GRPC_DEFAULT_SSL_ROOTS_FILE_PATH=/etc/ssl/certs/root_ca.pem
systemctl stop bank-app.service
cd /home/paloalto/apps
/usr/bin/python3.11 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
cp apps/bank-app.sh /usr/bin/
cp bank-app-protected.py bank-app.py 
systemctl start bank-app.service
systemctl status bank-app.service
echo "Done" >> /var/log/startup-script.log