#!/bin/bash
private_register_name=$REGISTRY_HUB

if [[ $private_register_name == "" ]]; then
    echo "env REGISTRY_HUB not defined"
    exit -1
fi

docker_image_name=harix-auto-test-oss-janus-build-base

docker build -t $private_register_name/$docker_image_name:$1 -f build/Dockerfile.build.base .

docker push $private_register_name/$docker_image_name:$1
