#!/bin/bash
private_register_name=$REGISTRY_HUB

if [[ $private_register_name == "" ]]; then
    echo "env REGISTRY_HUB not defined"
    exit -1
fi

docker_image_name=harix-auto-test-ffmpeg

docker build -t $private_register_name/$docker_image_name:$1 -f build/Dockerfile.ffmpeg .

docker push $private_register_name/$docker_image_name:$1
