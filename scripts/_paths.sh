# Get dir of current file
SCRIPT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Set the root dir
ROOT_PATH="$(realpath $SCRIPT_PATH/../)"

# Set the api dir
API_PATH="$(realpath $ROOT_PATH/src)"

# Set the server dir
SERVER_PATH="$(realpath $ROOT_PATH/nginx)"
