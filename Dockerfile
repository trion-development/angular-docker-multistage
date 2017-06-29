# Build using:
#   docker build -t trion/angular-app .
# Run with:
#   docker run -p 8080:8080 trion/angular-app

FROM trion/ng-cli:latest AS ngcli
WORKDIR /home/node
COPY . .
RUN npm install && ng build --prod --aot --progress=false

FROM nginx:alpine
COPY --from=ngcli /home/node/dist /usr/share/nginx/html/
COPY nginx/default.conf /etc/nginx/conf.d/default.conf.template
RUN chown -R nginx /etc/nginx

ENV PORT=8080
EXPOSE 8080

CMD ["/bin/sh","-c","envsubst '$PORT' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'"]
