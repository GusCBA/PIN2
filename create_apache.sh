#! /bin/bash
sudo yum update -y
sudo yum install -y httpd.x86_64
sudo systemctl enable httpd --now
touch /var/www/html/stierli.html
echo "H0l@ Mundo - Grupo4!" > /var/www/html/stierli.html
