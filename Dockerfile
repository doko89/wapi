FROM --platform=$BUILDPLATFORM node:17-alpine

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true \
    PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser

WORKDIR /usr/src/app

RUN apk update && apk add chromium

COPY package*.json ./

RUN npm install


# Bundle app source
COPY . .

EXPOSE 8000

CMD [ "node", "app.js" ]
