FROM node:6.7.0
MAINTAINER Hoang Nam "particle4dev@gmail.com"

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json /usr/src/app/

RUN npm install

# Bundle app source
COPY ./source /usr/src/app/source

EXPOSE 3000
CMD [ "npm", "start" ]