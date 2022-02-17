# stage 1
FROM node:latest as node
WORKDIR /app
COPY . .
RUN npm i -g npm
RUN npm install -g npm@8.5.0
RUN npm run build --prod

# stage 2
FROM nginx:alpine
COPY --from=node /app/dist/angular-app /usr/share/nginx/html