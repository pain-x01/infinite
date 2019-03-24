#!/usr/bin/env bash

ROOT='/home/ubuntu'
USER='ubuntu'

SERVER=''
if [[ "production" = $1 ]]; then
  SERVER='api.infinite.industries'

  # ssh $USER@$SERVER bash --login -i << EOF
  #   cd $ROOT
  #   echo 'Updating sources'
  #   git reset --hard HEAD
  #   git checkout master
  #   git pull origin master
  #   echo 'Installing npm packages'
  #   npm install
  #   echo 'Restarting'
  #   forever stop infinite
  #   rm /home/$USER/.forever/infinite.log
  #   forever start --uid infinite index.js
    echo 'Prod build not implemented yet!'
EOF

elif [[ "staging" = $1 ]]; then
  SERVER='staging-api.infinite.industries'  #not used yet

  ssh $USER@$SERVER bash --login -i << EOF

    cd $ROOT/temp-infinite/infinite
    echo 'Updating sources'
    git reset --hard HEAD
    git checkout development
    git pull

    cd ./api-server
    cp * -r $ROOT/infinite/.
    cd $ROOT/infinite

    echo 'Installing npm packages'
    npm install --production
    forever stop infinite
    rm $ROOT/.forever/infinite.log
    forever start --uid infinite index.js

    echo 'Done!'
EOF
else
  echo Please specify environment to deploy to.
  echo Usage: ./deploy.sh environment
  echo Example: ./deploy.sh staging
  exit
fi
