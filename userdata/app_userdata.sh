#!/bin/bash

# EFS 마운트
mount -t efs -o tls ${efs_id}:/ /var/www/html/wp-content

# wp-config.php 가져오기
aws ssm get-parameter \
    --name "/dev/wordpress/wp-config" \
    --with-decryption \
    --query "Parameter.Value" \
    --output text \
    > /var/www/html/wp-config.php

# CloudWatch Agent 시작
/opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl \
    -a fetch-config \
    -m ec2 \
    -s \
    -c ssm:/dev/cloudwatch-agent-config