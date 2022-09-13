#!/bin/bash
yum update -y
yum install -y httpd.x86_64
systemctl start httpd.service
systemctl enable httpd.service
echo "This is a public web server running on $(hostname -f)" > /var/www/html/index.html