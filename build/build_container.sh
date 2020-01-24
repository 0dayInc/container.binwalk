#!/bin/bash --login
provider_type=$1
box_version=$2
debug=false
export PACKER_LOG=1
set -e

function usage() {
  echo -e "USAGE: ${0} container.binwalk <container tag (e.g. 2019.3.1 || latest)> <debug>"
  exit 1
}

function pack() {
  provider_type=$1
  packer_provider_template=$2
  debug=$3
  packer_secrets='packer_secrets.json'

  if $debug; then
    packer build \
      -debug \
      -only $provider_type \
      -var "box_version=${box_version}" \
      -var-file=$packer_secrets \
      $packer_provider_template
  else
    packer build \
      -only $provider_type \
      -var "box_version=${box_version}" \
      -var-file=$packer_secrets \
      $packer_provider_template
  fi 
}

if [[ $# < 2 ]]; then
  usage
fi

if [[ $3 != '' ]]; then
  debug=true
fi

case $provider_type in
  "container.binwalk")
    pack docker container.binwalk.json $debug
    ;;
  *)
    usage
    exit 1
esac
