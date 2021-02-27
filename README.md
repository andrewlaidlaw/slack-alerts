# Slack Alerting Tool
A Node.js application for Node-RED based alerting system linked to Slack. This can be used as a Webhook endpoint for OpenShift Container Platform when running behind a proxy server.

## Deployment
This Github repository is designed to be a target for a Red Hat Openshift source-to-image build. This will build and deploy a new container image that includes the Node-Red environment with a simple flow to reformat the data from an OCP alert and send it to a Slack Webhook.

## Settings
To run correctly, you will need to pass in the appropriate values as Environment Variables. When using Red Hat Openshift this can be done using a Secret resource with key-value pairs for each of the required fields. The following varaiables need to be set:
- SLACK_URL

## Endpoints
- `/ocpalerts` - The primary endpoint for all alerts to be passed to
- `/alerts` - A summary of all alerts received (in json) since last deployment
- `/` - The root endpoint gives access to the Node-Red environment to make changes to the application
