FROM nginxinc/nginx-unprivileged
USER root
COPY  dist /usr/share/nginx/html
COPY nginx/maintenance.txt /usr/share/nginx/html/.maintenance
COPY nginx/nginx.conf /etc/nginx/conf.d/default.conf
WORKDIR /usr/share/nginx/html
RUN chgrp -R 101 /usr/share/nginx/html && chmod -R g+rwx /usr/share/nginx/html
USER nginx
