FROM node:22
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
CMD [ "node", "src/index.js" ]
