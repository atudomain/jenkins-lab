FROM alpine/git

ARG GIT_PASSWORD
RUN test -n "$GIT_PASSWORD"

USER root

# INSTALL SSH
RUN apk add openssh --no-cache

# ENABLE PASSWORDLESS SSH ACCESS
RUN echo "UseDNS no" >> /etc/ssh/sshd_config
RUN echo "Port 4444" >> /etc/ssh/sshd_config

# GENERATE KEYS
RUN ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa
RUN ssh-keygen -f /etc/ssh/ssh_host_dsa_key -N '' -t dsa

# CREATE USER
RUN adduser git --disabled-password
RUN echo -e "${GIT_PASSWORD}\n${GIT_PASSWORD}\n" | passwd git

# CREATE REPOSITORY
RUN mkdir -p /repo
RUN chown git:git /repo
USER git
RUN cd /repo && git init --bare --initial-branch=master

USER root
ENTRYPOINT ["/usr/sbin/sshd", "-D"]
