FROM node:18 as build
WORKDIR /usr/src/app
COPY package*.json ./

RUN npm install



FROM node:18

RUN apt update && apt install -y chromium && ln -s /usr/bin/chromium /usr/bin/chromium-browser
# Create app directory
WORKDIR /usr/src/app

COPY --from=build /usr/src/app/node_modules /usr/src/app/node_modules

# Bundle app source
COPY . .

EXPOSE 8000
CMD [ "node", "app.js" ]
