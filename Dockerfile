FROM node:lts-alpine as base
RUN apk add --no-cache g++ make py3-pip libc6-compat
WORKDIR /app
COPY package*.json .babelrc next.config.js ./
RUN npm install

FROM base as dev
WORKDIR /app
COPY . .
EXPOSE 3000
CMD ["npm", "run", "dev"]