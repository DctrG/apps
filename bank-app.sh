#!/bin/bash
export SSL_CERT_FILE=/etc/ssl/certs/root_ca.pem
export REQUESTS_CA_BUNDLE=/etc/ssl/certs/root_ca.pem
export GRPC_DEFAULT_SSL_ROOTS_FILE_PATH=/etc/ssl/certs/root_ca.pem

cd /home/paloalto/apps/
source venv/bin/activate
nohup streamlit run bank-app.py   --browser.serverAddress=localhost   --server.enableCORS=false —server.enableXsrfProtection=false   --server.port 80