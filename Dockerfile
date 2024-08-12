FROM node:lts-alpine AS base
RUN apk add --no-cache g++ make py3-pip libc6-compat
WORKDIR /app
COPY package*.json .babelrc next.config.js ./
RUN npm install

FROM base AS dev
COPY . .
EXPOSE 3001
CMD ["npm", "run", "dev"]