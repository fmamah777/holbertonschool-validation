#!/bin/bash

# Create the EC2 instance and print the public IP address
aws ec2 run-instances \
	--image-id ami-0568936c8d2b91c4e \
	--instance-type t2.micro \
	--subnet-id subnet-0584ee42a38f71993 \
	--security-group-ids sg-0983c9a30720ce76a \
	--key-name awesome-key \
	--query 'Instances[*].InstanceId' \
	--output text \
| xargs -I {} aws ec2 describe-instances \
	--instance-ids {} \
	--query 'Reservations[*].Instances[*].PublicIpAddress' \
	--output text
