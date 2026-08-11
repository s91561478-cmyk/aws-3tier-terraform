#!/bin/bash

# Mount EFS
mount -t efs -o tls ${efs_id}:/ /var/www/html/wp-content

# Get WordPress configuration from SSM Parameter Store
aws ssm get-parameter \
  --name "/dev/wordpress/wp-config" \
  --with-decryption \
  --query "Parameter.Value" \
  --output text \
  > /var/www/html/wp-config.php

# Start CloudWatch Agent
/opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl \
  -a fetch-config \
  -m ec2 \
  -s \
  -c ssm:/dev/cloudwatch-agent-config