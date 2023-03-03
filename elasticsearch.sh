#!/bin/bash

##################################
## for installing the SSM-agent ##
##################################
yum update -y
cd /tmp
sudo yum install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm
sudo systemctl enable amazon-ssm-agent
sudo systemctl start amazon-ssm-agent
yum update -y

################################################
## for installing the elastic-search (v7.17.8)##
################################################
wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.17.8-x86_64.rpm
wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.17.8-x86_64.rpm.sha512
shasum -a 512 -c elasticsearch-7.17.8-x86_64.rpm.sha512
sudo rpm --install elasticsearch-7.17.8-x86_64.rpm

sudo systemctl daemon-reload
sudo systemctl enable elasticsearch.service
sudo systemctl start elasticsearch.service

#######################################
## Update the elasticsearch.yml file ##
#######################################
private_ip=`curl http://169.254.169.254/latest/meta-data/local-ipv4`
#echo "http.port: 9200"  >> /etc/elasticsearch/elasticsearch.yml
#echo "network.host: $private_ip"  >> /etc/elasticsearch/elasticsearch.yml
echo "http.port: 9200"  >> /etc/elasticsearch/elasticsearch.yml
echo "transport.host: localhost"  >> /etc/elasticsearch/elasticsearch.yml
echo "transport.tcp.port: 9300"  >> /etc/elasticsearch/elasticsearch.yml
echo "network.host: 0.0.0.0"  >> /etc/elasticsearch/elasticsearch.yml
echo "path.repo: ["/tmp/es_backup"]"  >> /etc/elasticsearch/elasticsearch.yml
sed -i '/xpack.security.enabled: true/c\xpack.security.enabled: false' /etc/elasticsearch/elasticsearch.yml
sed -i '/xpack.security.enrollment.enabled: true/c\xpack.security.enrollment.enabled: false' /etc/elasticsearch/elasticsearch.yml
sudo systemctl restart elasticsearch.service
