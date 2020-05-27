FROM nginx:latest
WORKDIR /redirect
COPY . .
ENTRYPOINT ["/redirect/start.sh"]
