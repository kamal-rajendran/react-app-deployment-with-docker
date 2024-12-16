#!/bin/bash

#login into DockerHub:
docker login -u kamalrajendran -p dckr_pat__wsQVZ15feXI_dHsKoJbeQOtBWk

#stopping existing container:
docker stop 78fa2c93ee3e
docker rm 78fa2c93ee3e

#building a image:
docker build -t react-ci/cd .

#running a container from the created image:
docker run -d -it --name react -p 80:80 react-ci/cd

#pushing the image to dockerhub:
docker tag react-ci/cd kamalrajendran/react-app:ci-cd
docker push kamalrajendran/react-app:ci-cd
