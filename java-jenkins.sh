#!/bin/bash

set -e  # exit immediately if a command fails

echo "---- Updating system ----"
sudo apt update -y && sudo apt upgrade -y

echo "---- Installing Java 17 ----"
sudo apt install -y openjdk-17-jdk

echo "---- Adding Jenkins repo & key ----"
curl -fsSL https://pkg.jenkins.io/debian/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt update -y

echo "---- Installing Jenkins ----"
sudo apt install -y jenkins

echo "---- Starting Jenkins ----"
sudo systemctl start jenkins
sudo systemctl enable jenkins

echo "---- Jenkins Status ----"
systemctl status jenkins --no-pager
