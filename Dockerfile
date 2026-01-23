FROM node:14.21-alpine as builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
ARG VUE_APP_BACKEND
ENV VUE_APP_BACKEND=$VUE_APP_BACKEND
RUN npm run build
EXPOSE 8000
CMD [ "npm", "run", "serve" ]
