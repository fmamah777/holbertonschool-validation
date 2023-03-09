#!/bin/bash

# Read the IP address from the file
new_ec2_instance_public_ip=$(cat awesome_image_tag_name.txt)
dockerImageTag=$(cat awesome_image_tag_name.txt)

scp -o StrictHostKeyChecking=accept-new -i ~/.ssh/awesome-key.pem ./awesome.tar.zip ubuntu@"$new_ec2_instance_public_ip":/home/ubuntu/

ssh -o StrictHostKeyChecking=accept-new -i ~/.ssh/awesome-key.pem ubuntu@"$new_ec2_instance_public_ip" "
	unzip ./awesome.tar.zip
	docker load --input awesome.tar
	docker run --detach -p 80:9999 -p 443:9999 --restart='always' awesome:$dockerImageTag
"