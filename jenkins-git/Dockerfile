FROM nginx

ARG GIT_PASSWORD
RUN test -n "$GIT_PASSWORD"

# COPY NGINX DEFAULT CONFIGURATION
COPY default.conf /etc/nginx/conf.d/default.conf

# INSTALL GIT
RUN apt-get update
RUN apt-get install -y git

# INSTALL APACHE2 UTILS
RUN apt-get install -y apache2-utils

# INSTALL FCGI WRAP
RUN apt-get install -y fcgiwrap

# CREATE REPOSITORY
RUN mkdir -p /git/jenkins
RUN cd /git/jenkins && git init --bare && git update-server-info

# SET PASSWORD FOR REPOSITORIES
RUN htpasswd -cb /git/htpasswd jenkins "$GIT_PASSWORD"

CMD /etc/init.d/fcgiwrap start && chown nginx:nginx /var/run/fcgiwrap.socket && nginx -g 'daemon off;'
