FROM nginxinc/nginx-unprivileged
USER root
COPY  dist /usr/share/nginx/html
COPY nginx/maintenance.txt /usr/share/nginx/html/.maintenance
COPY nginx/nginx.conf /etc/nginx/conf.d/default.conf
RUN mkdir /usr/share/nginx/html/health/ && chown nginx:nginx /usr/share/nginx/html/health/
COPY nginx/health.html /usr/share/nginx/html/health/healthz.html
WORKDIR /usr/share/nginx/html
RUN chgrp -R 101 /usr/share/nginx/html && chmod -R g+rwx /usr/share/nginx/html
USER nginx
