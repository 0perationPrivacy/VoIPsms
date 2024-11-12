FROM docker.io/library/node:alpine

# Choose the port 
EXPOSE 3000:3000

# Environment variables
ENV NPM_CONFIG_PREFIX=/home/node/.npm-global
ENV PATH=$PATH:/home/node/.npm-global/bin
RUN apk update&&apk add git&&rm -rf /var/cache/apk/*
# Install app dependencies
WORKDIR /home/node/app
RUN git clone https://github.com/macide213/VoIP.git .
RUN npm install 

# Install app 
RUN chown -R node:node .
USER node

CMD [ "node", "app.js" ]
