FROM node:13
# Home directory for Node-RED application source code.
RUN mkdir -p /usr/src/node-red
RUN chmod -R 777 /usr/src/node-red
# User data directory, contains flows, config and nodes.
RUN mkdir /data
RUN chmod -R 777 /data
WORKDIR /usr/src/node-red
# Add node-red user so we aren't running as root.
#RUN useradd --home-dir /usr/src/node-red --no-create-home node-red \
#    && chown -R node-red:node-red /data \
#    && chown -R node-red:node-red /usr/src/node-red
#USER node-red
# package.json contains Node-RED NPM module and node dependencies
COPY package.json /usr/src/node-red/
COPY slack-alerts-flow.json /usr/src/node-red/
RUN npm install
# User configuration directory volume
EXPOSE 8080
# Environment variable holding file path for flows configuration
ENV FLOWS=slack-alerts-flow.json
CMD ["npm", "start", "--", "--userDir", "/data"]