FROM node:15-alpine3.10

WORKDIR /usr/src/app

COPY package.json .

RUN npm i

COPY index.js .

EXPOSE 3000

CMD ["node", "index.js"]