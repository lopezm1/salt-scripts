# salt-scripts
general salt-scripts that have helped me


## bootstrap-salt-codedeploy.sh

Installs codedeploy and registers salt-minion to a salt-master. 

Useful when you need to register a minion to a salt-master within your AWS envrionment and you want to utilize AWS Codedeploy to orchestrate deployments. 

- dynamic by region
- installs codedeploy-agent
- registers salt-minion to master

Run this as a shell script on an EC2 instance. 

Replace $INSTANCE_PREFIX and $SALT_MASTER_IP with your own variables.