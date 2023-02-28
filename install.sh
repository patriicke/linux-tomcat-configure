#!/bin/bash
sudo apt-get install tomcat9 tomcat9-admin -y

echo
echo "======== Starting tomcat configuration ============="
echo
read -p "Enter username for Tomcat user: " username
read -p "Enter password for Tomcat user: " password
echo

sudo ufw allow from any to any port 8080 proto tcp

sudo sed -i '/<\/tomcat-users>/i <role rolename="tomcat"/>\n<role rolename="role1"/>\n<user username="'"$username"'" password="'"$password"'" roles="manager-gui"/>' /etc/tomcat9/tomcat-users.xml

sudo systemctl restart tomcat9

echo "Thank you for using Patrick's Tomcat installation script."
