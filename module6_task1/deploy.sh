#!/bin/bash

# Read the IP address from the file
new_ec2_instance_public_ip=$(cat new_ec2_instance_public_ip.txt)

# Read the name of the tag to use with the docker image
dockerImageTag=$(cat awesome_image_tag_name.txt)

docker context create production --docker "host=ssh://ubuntu@$new_ec2_instance_public_ip"
docker context use production

docker pull echo/awesome-static:"$dockerImageTag"
docker pull echo/awesome-api:"$dockerImageTag"
docker pull echo/reverse-proxy:"$dockerImageTag"
docker compose up --detach --scale awesome-api=2 reverse-proxy
