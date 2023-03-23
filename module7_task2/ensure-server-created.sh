#!/bin/bash

if [ -z "$1" ]; then
	echo "Error: instance name not set"
	exit 1
fi

# Create the EC2 instance and print the public IP address
aws ec2 run-instances \
	--image-id ami-0568936c8d2b91c4e \
	--instance-type t2.micro \
	--subnet-id subnet-02e94098977dfa45d \
	--security-group-ids sg-09f59566ca50f9b1e \
	--key-name awesome-key \
	--tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$1}]" \
	--query 'Instances[*].InstanceId' \
	--output text \
| xargs -I {} aws ec2 describe-instances \
	--instance-ids {} \
	--query 'Reservations[*].Instances[*].PublicIpAddress' \
	--output text

create-servers:
