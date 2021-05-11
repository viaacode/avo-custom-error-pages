FROM nginxinc/nginx-unprivileged
USER root
COPY openshift/default.conf /etc/nginx/conf.d/default.conf
COPY  dist/index.html /usr/share/nginx/html
WORKDIR /usr/share/nginx/html
RUN chgrp -R 101 /usr/share/nginx/html && chmod -R g+rwx /usr/share/nginx/html
USER nginx
