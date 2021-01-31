FROM jenkins/jenkins:latest

ARG JENKINS_PASSWORD
RUN test -n "$JENKINS_PASSWORD"

ARG GIT_PASSWORD
RUN test -n "$GIT_PASSWORD"

USER root

# DISABLE INTERACTIVE SETUP
ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"

# COPY AUTOMATED CONFIGURATION
ENV CASC_JENKINS_CONFIG=/casc.yml
COPY casc.yml /casc.yml
RUN sed -i "s/JENKINS_PASSWORD/$JENKINS_PASSWORD/g" /casc.yml
RUN sed -i "s/GIT_PASSWORD/$GIT_PASSWORD/g" /casc.yml

# INSTALL PLUGINS
COPY plugins.txt /plugins.txt
RUN jenkins-plugin-cli --plugins -f /plugins.txt

# COPY JOBS FROM TEMPLATE
COPY jobs /var/jenkins_home/jobs
RUN chown -R root:root /var/jenkins_home/jobs

# INSTALL DOCKER-CE-CLI
RUN apt-get update
RUN apt-get install -y apt-transport-https
RUN apt-get install -y ca-certificates
RUN apt-get install -y curl
RUN apt-get install -y gnupg-agent
RUN apt-get install -y software-properties-common
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
RUN apt-get update
RUN apt-get install -y docker-ce-cli

