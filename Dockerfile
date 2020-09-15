FROM node:12.18.3-alpine
# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN apk --no-cache add curl

# fix npm private module
ARG NPM_TOKEN
COPY .npmrc /usr/src/app/
COPY package*.json /usr/src/app/
COPY . /usr/src/app

# Install app dependencies
RUN npm install
RUN rm -f .npmrc
RUN npm install gulp -g
RUN npm install tsd -g
RUN tsd install
#RUN gulp
# Bundle app source
RUN npm run prepare
EXPOSE 3333
CMD [ "node", "dist/server.js" ]
