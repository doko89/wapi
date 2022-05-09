FROM --platform=$BUILDPLATFORM node:alpine

WORKDIR /usr/src/app

RUN apk update && apk add chromium

COPY package*.json ./

RUN npm install


# Bundle app source
COPY . .

EXPOSE 8000

CMD [ "node", "app.js" ]
