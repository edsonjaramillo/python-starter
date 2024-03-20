#!/bin/bash

commands=(
  clean_cache-"Clean the cache"
  clean_deps-"Clean the dependencies"
  format-"Format the code"
  freeze-"Freeze the requirements"
  install-"Install the requirements"
  lint-"Lint the code"
  precommit-"Runs formatting, sorting ,linting, and tests"
  setup-"Setup the project"
  sort-"Sort the imports"
  test-"Run the tests"
)

max_length=0
# loop through the commands to find the maximum length of the commands
for command in "${commands[@]}"; do
  command_name=$(echo "$command" | cut -d'-' -f1)
  if [ ${#command_name} -gt $max_length ]; then
    max_length=${#command_name}
  fi
done


# loop through the commands to print the help
for command in "${commands[@]}"; do
  command_name=$(echo "$command" | cut -d'-' -f1)
  command_description=$(echo "$command" | cut -d'-' -f2)
  printf "  \e[33m%-*s\e[0m - %s\n" $max_length "$command_name" "$command_description"
done