#! /bin/bash

sudo yum update -y
sudo yum install -y wget
sudo yum install -y unzip
sudo yum install -y httpd
sudo systemctl start httpd  
sudo systemctl enable httpd

cd var/www/html
wget https://linux-devops-course.s3.amazonaws.com/WEB+SIDE+HTML/static-website-example.zip 
unzip static-website-example.zip 
cp -R static-website-example/* . 
rm -rf static-website-example.zip 
rm -rf static-website-example


##!/bin/bash

#sudo yum install httpd
#
#sudo service httpd start
#
#sudo chkconfig httpd on
#
#sudo service httpd status
#
#Hello Cloud Winners||
#This is our First Server
#
#<a href="asylearnacademy.ulearnhub.org“>Visit Cloud Winners|| Community /a>




#<html xmlns="http://www.w3.org/1999/xhtml" >
#<head>
#    <title>My Website Home Page</title>
#</head>
#<body>
#  <h1>Welcome to my website</h1>
#  <p>Now hosted on Amazon S3!</p>
#</body>
#</html>