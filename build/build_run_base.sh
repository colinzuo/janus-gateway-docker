#!/bin/bash
private_register_name=$REGISTRY_HUB
if [[ $private_register_name == "" ]]; then
    private_register_name="harbor.cloudminds.com/hari"
fi

docker_image_name=harix-auto-test-oss-janus-run-base

docker build -t $private_register_name/$docker_image_name:$1 -f build/Dockerfile.run.base .

docker push $private_register_name/$docker_image_name:$1
