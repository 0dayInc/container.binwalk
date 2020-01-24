#!/bin/bash --login
date -u +%Y-%m-%d_%H.%M.%S
debug=$1

function usage() {
  echo $"Usage: $0 <debug (optional)>"
  date -u +%Y-%m-%d_%H.%M.%S
  exit 1
}

function deploy_docker_container() {
  
  if [[ $debug == '' ]]; then
    vagrant up --provider=docker
  else
    vagrant up --provider=docker --debug
  fi

}

if [[ $# > 1  ]]; then
  usage
fi

export DOCKER_CONTAINER_TARGET="container.binwalk"
deploy_docker_container

date -u +%Y-%m-%d_%H.%M.%S
