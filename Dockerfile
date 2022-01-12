FROM nginxinc/nginx-unprivileged
USER root
COPY  dist /usr/share/nginx/html
COPY nginx/maintenance.txt /usr/share/nginx/html/.maintenance
COPY nginx/health.html /usr/share/nginx/html/health/healthz.html
COPY --chown=101:101 docker-entrypoint /docker-entrypoint
RUN chmod +x /docker-entrypoint
## set this to some value to show MAINTENANCE , if not set render error page
#ENV MAINTENANCE true
COPY nginx/nginx.conf /etc/nginx/conf.d/default.conf
WORKDIR /usr/share/nginx/html
RUN chgrp -R 101 /usr/share/nginx/html && chmod -R g+rwx /usr/share/nginx/html
USER nginx
ENTRYPOINT /docker-entrypoint
