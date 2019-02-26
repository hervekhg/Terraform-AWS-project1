#!/bin/bash

#self configuration script INFRA
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1

#Update package
sudo yum update -y

# Install ansible
easy_install pip

# Instance name and ID
AWS_REGION="${region}"
INSTANCE_ID="$( curl http://169.254.169.254/1.0/meta-data/instance-id )"

#Download Ansible scripts
if [ ! -d "/home/ec2-user/${project_name}" ]; then
    su - ec2-user -c "mkdir /home/ec2-user/${project_name}"
fi
su - ec2-user -c "aws s3 cp s3://${app_bucket}/projects/${project_name}/releases/${version_lot}/${project_name}-ansible.tar.gz /tmp"
su - ec2-user -c "tar -xzf /tmp/${project_name}-ansible.tar.gz -C /home/ec2-user/${project_name}"

#Ansible installation
pip install ansible==$(cat /home/ec2-user/${project_name}/.ansible.version)
pip install python-consul
pip install boto3
pip install awscli --upgrade

#Consul management
export ANSIBLE_CONSUL_HOST=consul.pipeline.aws
export ANSIBLE_CONSUL_PORT=80
export ANSIBLE_CONSUL_URL=http://$${ANSIBLE_CONSUL_HOST}:$${ANSIBLE_CONSUL_PORT}
export ANSIBLE_CONSUL_PATH="${env}/${project_name}/${install_name}"
echo "export ANSIBLE_CONSUL_PATH=$${ANSIBLE_CONSUL_PATH} ;" >> ~/.bashrc
echo "export ANSIBLE_CONSUL_URL=$${ANSIBLE_CONSUL_URL} ;" >> ~/.bashrc

#Export app vars because there is not peering to consul
#Deployment app
su - ec2-user -c "export ANSIBLE_CONSUL_HOST=$${ANSIBLE_CONSUL_HOST} && export ANSIBLE_CONSUL_PORT=$${ANSIBLE_CONSUL_PORT} &&
export ANSIBLE_CONSUL_PATH=$${ANSIBLE_CONSUL_PATH} && export ANSIBLE_CONSUL_URL=$${ANSIBLE_CONSUL_URL} &&
export app_bucket=${app_bucket} && export region=${region} &&
/usr/local/bin/ansible-playbook -vvv /home/ec2-user/${project_name}/main.yml -e env=\"${env}\" -e install_name=\"${install_name}\" -e project_name=\"${project_name}\" -e version_lot=\"${version_lot}\""

#Remove tmp files
su - ec2-user -c "rm /tmp/${project_name}-ansible.tar.gz"