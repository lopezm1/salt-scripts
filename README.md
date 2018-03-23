# salt-scripts
general salt-scripts that have helped me


## bootstrap-salt-codedeploy.sh

Technical Stack: SaltStack, EC2(CentOS)

Installs codedeploy and automatically registers salt-minion to a salt-master. 

- dynamic by region
- installs codedeploy-agent
- registers salt-minion to master

Run this as a bootstrapping script on an EC2 instance. 

Replace $INSTANCE_PREFIX and $SALT_MASTER_IP with your own variables.