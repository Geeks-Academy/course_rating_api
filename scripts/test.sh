# Include base
source $(dirname $0)/_base.sh
source $(dirname $0)/_paths.sh

declare -a arguments
declare -A options
declare -A schema=(
  ["--no-cache"]=0
  ["--env"]=1
  ["--skip-migrations"]=0
  ["--skip-composer"]=0
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

# Execute tests
docker-compose exec -T api php artisan test

TEST_STATUS=$?

docker-compose stop

if [ $TEST_STATUS -gt 0 ]
  then
    printf "\n\033[0;31mTests failed\n\n"
  else
    printf "\n\033[0;32mTests succeed\033[0m\n\n"
fi

exit $TEST_STATUS
