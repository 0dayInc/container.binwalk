#!/bin/bash
if [[ $1 != "" && $2 != "" && $3 != "" ]]; then
  git pull
  git add . --all
  git commit -a -S --author="${1} <${2}>" -m "${3}"
  # TODO: Add tagging convention
else
  echo "USAGE: ${0} '<full name>' <email address> '<git commit comments>'"
fi
