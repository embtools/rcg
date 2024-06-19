
FROM node:alpine3.20

# build dependencies
COPY ./package.json ./
RUN npm install --production

COPY ./src/index.js ./

EXPOSE 8080

CMD npm install && npm start
