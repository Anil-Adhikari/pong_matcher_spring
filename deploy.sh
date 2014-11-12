#!/bin/bash

set -xe

docker pull docker.gocd.cf-app.com:5000/pong-matcher-spring
docker run -e "CF_HOME=/pong_matcher_spring" -t docker.gocd.cf-app.com:5000/pong-matcher-spring /bin/bash -c "\
    cd pong_matcher_spring
    cf api https://api.run.pivotal.io &&
    cf auth $CF_USERNAME $CF_PASSWORD &&
    cf target -o $CF_ORG -s $CF_SPACE &&
    cf push -n $HOSTNAME -d cfapps.io"
