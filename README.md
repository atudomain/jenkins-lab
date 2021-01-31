# jenkins-lab-as-a-code

Fully automated Jenkins setup as a code.

Features:
- Set of preinstalled plugins
- Jenkins connection to Docker socket (can run containers)
- Git http server you can use to instantly test your pipelines
- Everything is up and running including job and connection to git server

Prerequisites:
- Free port 8080 (for Jenkins)
- Free port 4444 (for Git http server)

# Usage

Copy env file to .env file and write down your passwords:
```
JENKINS_PASSWORD=
GIT_PASSWORD=
```

Both usernames are jenkins.

Run:
```
docker-compose up -d --build
```

After it finishes, everything is ready!

# Accessing Jenkins

Access 127.0.0.1:8080 in you browser. Connections are only from 127.0.0.1 by default.

Username is jenkins and password is JENKINS_PASSWORD you set in .env file.

# Accessing Git http server

Default pipeline is available after installation, so you can immediately test the TEST job in Jenkins.
To pull the repository:
```
git clone http://127.0.0.1:4444/jenkins
```
then provide username jenkins and GIT_PASSWORD as set in .env file.

To test your own pipelines easily, you can overwrite the repository, for example:
```
git push http://127.0.0.1:4444/jenkins master --force
```

For longer development, you can add this repo as remote and store git credentials.

# Using the git server from Jenkins
Jenkins can see the git server under jenkins-git domain.

Credentials with id jenkins-git allow connecting to http://jenkins-git:4444/jenkins

You can potentially push shared libs to that repository as well.

# Volumes

By default, jenkins home is mounted under data directory.

Remove the directory if you want clean install (backup it if precious).

# Issues

For yet unknown reason downloading plugins sometimes hangs. Run CTRL+C and issue docker compose up -d.
