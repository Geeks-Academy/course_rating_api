#!/bin/bash

# Include base
source $(dirname $0)/_paths.sh
source $(dirname $0)/_base.sh

declare -A shells=(
  ["api"]="/bin/bash"
  ["web"]="/bin/ash"
)

declare -a arguments
declare -A options
declare -A schema=(
  ["--boot"]=0
  ["--env"]=1
)

# Load options and args
getOptions schema options arguments $@

if inMap options "--env" ; then
  APP_ENV=${options["--env"]}
else
  APP_ENV="dev"
fi

if inMap options "--boot" ; then
  BOOT=1
else
  BOOT=0
fi

cd $ROOT_PATH


if isFalse $BOOT ; then
  docker-compose exec $1 ${shells[$1]}
else
  docker-compose -f docker-compose.yml -f docker-compose.$APP_ENV.yml run --no-deps ${arguments[0]} ${shells[${arguments[0]}]}
fi
