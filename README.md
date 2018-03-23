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


## cloud-init-salt-codedeploy.yml

Technical Stack: SaltStack, EC2(CentOS)

Use this as the cloud-init data for an EC2 instance. Works fanstastically with auto-scaling-groups. Recommend placing this script in a cloudformation or terraform script. 

Installs codedeploy and automatically registers salt-minion to a salt-master.

- dynamic by region
- installs codedeploy-agent
- registers salt-minion to master
- auto-deploy your latest revision from a CodeDeploy deployment group to this instance 

Replace $SALT_MASTER_IP with the IP of your salt-master. Don't forget to tag your EC2 instance with a "Name" tag. Naming is important when it comes to defining salt environments. 

For example:
- _stage-api_
- _stage-www_
- _test-api_
- _test-www_

These are all great examples of "Name" tags for instances because it allows you to apply salt states by '*www', '*api', 'stage*' or 'test*' or some other combination. 

This can be extremely useful for defining how you run salt commands. This naming convention would allow you to run salt commands in the following way: 

_salt 'stage*' state.show_top_ 

This command would only apply salt states to environments tagged with _stage_ in their name. In this example, that would mean the stage-api and stage-www server. 

