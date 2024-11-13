#!/bin/bash

source /root/venv/bin/activate
cd /home/paloalto/apps/
nohup streamlit run bank-app.py   --browser.serverAddress=localhost   --server.enableCORS=false —server.enableXsrfProtection=false   --server.port 80