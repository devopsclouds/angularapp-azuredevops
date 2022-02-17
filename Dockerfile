FROM node:14.17.1-alpine3.13 as node
WORKDIR /app
COPY . .
#RUN npm i -g npm
RUN npm -g install 
RUN npm run build --prod

# stage 2
FROM nginx:alpine
COPY --from=node /app/dist/angular-app /usr/share/nginx/html