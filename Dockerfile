FROM --platform=$BUILDPLATFORM node:alpine as builder

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

FROM --platform=$BUILDPLATFORM node:alpine

RUN apk update && apk add chromium

COPY --from=build /usr/src/app/node_modules /usr/src/app/node_modules

# Bundle app source
COPY . .

EXPOSE 8000

CMD [ "node", "app.js" ]
