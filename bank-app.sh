#!/bin/bash
export SSL_CERT_FILE=/etc/ssl/certs/root_ca.pem
export REQUESTS_CA_BUNDLE=/etc/ssl/certs/root_ca.pem
export GRPC_DEFAULT_SSL_ROOTS_FILE_PATH=/etc/ssl/certs/root_ca.pem

source venv/bin/activate
cd /home/paloalto/apps/
nohup streamlit run bank-app.py   --browser.serverAddress=localhost   --server.enableCORS=false —server.enableXsrfProtection=false   --server.port 80