#!/bin/bash

# Include base
source $(dirname $0)/_paths.sh
source $(dirname $0)/_base.sh

declare -a arguments
declare -A options
declare -A schema=(
  ["--env"]=1
)

# Load options and args
getOptions schema options arguments $@

if inMap options "--env" ; then
  APP_ENV=${options["--env"]}
else
  APP_ENV="dev"
fi

cd $ROOT_PATH

# Start container
docker-compose -f docker-compose.yml -f docker-compose.$APP_ENV.yml up -d
