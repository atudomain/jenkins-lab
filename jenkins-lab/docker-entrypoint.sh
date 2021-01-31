#!/usr/bin/env bash

cp -rn /jobs /var/jenkins_home

exec /usr/local/bin/jenkins.sh "$@"
