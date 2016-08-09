#!/bin/bash -e
 
BUCKET= "tf-status"
PROJECT="$1"
REGION="eu-west-1"
 
init() {
  if [ -d ${PROJECT}/.terraform ]; then
    if [ -e ${PROJECT}/.terraform/terraform.tfstate ]; then
      echo "Remote state already exist!"
      if [ -z $IGNORE_INIT ]; then
        exit 1
      fi
    fi
  fi
 
 
  terraform remote config \
    -backend=s3 \
    -backend-config="bucket=${BUCKET}" \
    -backend-config="key=${PROJECT}/terraform.tfstate" \
    -backend-config="region=${REGION}"
 
}
 
while getopts "i" opt; do
  case "$opt" in
    i)
      IGNORE_INIT="true"
      ;;
  esac
done
 
shift $((OPTIND-1))
 
init
