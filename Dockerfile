FROM nginx:alpine

COPY src /usr/share/nginx/html
COPY nginx/maintenance.txt /usr/share/nginx/html/.maintenance
COPY nginx/nginx.conf /etc/nginx/conf.d/default.conf
