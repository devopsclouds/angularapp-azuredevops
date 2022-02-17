FROM node:14.17.1-alpine3.13 as node
WORKDIR /app
COPY . .
#RUN npm i -g npm
#RUN npm cache clean --force
#RUN rm -rf node_modules
RUN npm -g install 
RUN $(npm bin)/ng build --prod
#RUN node_modules/.bin/ng build --prod

# stage 2
FROM nginx:alpine
COPY --from=node /app/dist/angular-app /usr/share/nginx/html