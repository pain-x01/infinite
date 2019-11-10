#!/usr/bin/env bash

# This script assumes the remote host has a correctly configured .env file
# in the root of the user directory. This is what will be used

set -e
ROOT='/home/ubuntu'
USER='ubuntu'
GIT_HEAD=''

SERVER=''

function promptUser {
  echo "WARNING THIS IS PROD: Are you sure?"
  select yn in "yes" "no"; do
    case $yn in
      yes ) doDeploy; break;;
      no ) exit;;
    esac
done
}

function doDeploy {
  ssh $USER@$SERVER bash --login -i  << EOF

  echo "ROOT: $ROOT"
  rm -R $ROOT/temp-infinite
  mkdir -p $ROOT/temp-infinite
  cd $ROOT/temp-infinite

  git clone https://github.com/infinite-industries/infinite.git ./
  # git pull origin development
  git checkout $GIT_HEAD
  cd ./web-portal
  cp $ROOT/.env $ROOT/temp-infinite/web-portal/ # copy .env file

  echo 'Installing npm packages'
  npm install # this sucks we have to pull in cypress :-(

  echo 'Build Nuxt'
  npm run build

  echo 'stop infinite'
  forever stop infinite

  echo 'copying build to running directory'
  mkdir -p $ROOT/web-portal
  cp ./. -r $ROOT/web-portal/
  cd $ROOT/web-portal

  if [ -f "$ROOT/.forever/infinite.log" ]
  then
    echo 'deleting old log file'
    rm $ROOT/.forever/infinite.log
  fi

  forever start -a --uid infinite -c "npm start" ./
  echo 'Done!'
EOF
}

if [[ "production" = $1 ]]; then
  SERVER='infinite.industries'
  GIT_HEAD='master'
  promptUser
elif [[ "staging" = $1 ]]; then
  SERVER='staging.infinite.industries'
  GIT_HEAD='development'
  doDeploy
else
  echo Please specify environment to deploy to.
  echo Usage: ./deploy.sh environment
  echo Example: ./deploy.sh staging
  exit
fi

