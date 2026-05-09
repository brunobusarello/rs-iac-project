#!/bin/bash

yum update -y
yum install -y httpd

systemctl start httpd
systemctl enable httpd

TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" \
  -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")

INSTANCE_ID=$$(curl -H "X-aws-ec2-metadata-token: $TOKEN" \
  http://169.254.169.254/latest/meta-data/instance-id)

echo "<h1>Environment: $${environment}</h1>" > /var/www/html/index.html
echo "<h2>Instance ID: $INSTANCE_ID</h2>" >> /var/www/html/index.html