#!/bin/bash
# Will call the Dynatrace CLI in Docker and push deployment information for the host that is specified in monspec/monspec.json
# we assume that Dynatrace CLI is installed in ../dynatrace_cli

if [ -z "$1" ]; then
  echo "Usage: Arg 1 needs to be an EntityName/Environment combination, e.g: MaaSHost/Lab2 or FrontendApp/Dev"
  exit 1
fi
DEPLOYMENT_NAME=$2
if [ -z "$2" ]; then
  DEPLOYMENT_NAME="MyCustomDeployment"
fi
VERSION=$3
if [ -z "$3" ]; then
  VERSION="Version1"
fi

bash ../dynatrace-cli/dtclidocker.sh monspec pushdeploy monspec/monspec.json monspec/pipelineinfo.json $1 $DEPLOYMENT_NAME $VERSION