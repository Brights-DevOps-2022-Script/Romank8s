# Use the official Nginx image as the base image
FROM nginx:latest
COPY ./index.html /usr/share/nginx/html/index.html
EXPOSE 80