#!/bin/bash

# Fetch metadata values
PROJECT_ID=$(curl -H "Metadata-Flavor: Google" "http://metadata.google.internal/computeMetadata/v1/instance/attributes/project-id")
REGION=$(curl -H "Metadata-Flavor: Google" "http://metadata.google.internal/computeMetadata/v1/instance/attributes/region")

# Export as environment variables
echo "export GCP_PROJECT=${PROJECT_ID}" >> /etc/profile.d/gce_project_id.sh
echo "export GCP_REGION=${REGION}" >> /etc/profile.d/gce_region.sh

cd /home/paloalto/apps/
source /root/venv/bin/activate
#pip install -r requirements.txt
nohup streamlit run gemini-app.py --browser.serverAddress=localhost --server.enableCORS=false --server.enableXsrfProtection=false --server.port 8080