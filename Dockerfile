FROM node:17

RUN apt update && apt install -y chromium && ln -s /usr/bin/chromium /usr/bin/chromium-browser
# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY . .

EXPOSE 8000
CMD [ "node", "app.js" ]
