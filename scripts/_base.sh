# Check if element is in array
function inArray() {
  local -n __in_arr_array=$1
  declare -r __in_arr_search=$2

  for i in "${__in_arr_array[@]}"
  do
      if [ "$i" = "$__in_arr_search" ] ; then
          return
      fi
  done

  false
}

# Check if element is in map
function inMap() {
    local -n __in_map_array=$1
    declare -r __in_map_search=$2

    if [ -v __in_map_array[$__in_map_search] ]; then
      return
    fi

    false
}

# Check if variable or command exists
function exists() {
  if [ -v $1 ]; then
    return
  fi

  false
}

# Check if variable is true (equals 1)
function isTrue() {
  if [ $1 -eq 1 ]; then
    return
  fi

  false
}

# Check if variable is false (equals 0)
function isFalse() {
  if [ $1 -eq 0 ]; then
    return
  fi

  false
}

# Get options and arguments
function getOptions() {
  local -n __options_schema=$1
  declare -n __options_options=$2
  declare -n __options_arguments=$3

  shift 3

  while [ $# -gt 0 ]; do
    if inMap __options_schema $1 ; then
      if isTrue ${__options_schema[$1]} ; then
        if [ $# -gt 1 ] ; then
          __options_options[$1]=$2
        else
          echo "Error: option \"$1\" doesn't have specified value"
          exit 1
        fi

        shift 2
      else
        __options_options[$1]=1

        shift
      fi
    else
      __options_arguments+=($1)
      shift
    fi
  done
}
