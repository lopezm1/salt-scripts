# Dynamically fetch region for EC2 in aws
region=$(curl http://169.254.169.254/latest/meta-data/placement/availability-zone | sed ’s/.$//‘);

# gr8 packaages
sudo yum -y install ruby wget jq;

# Install codedeploy https://aws.amazon.com/codedeploy/
sudo cd /home/ec2-user;
sudo wget https://aws-codedeploy-${region}.s3.amazonaws.com/latest/install;
sudo chmod +x ./install;
sudo ./install auto;
sudo service codedeploy-agent start;

# Names used to register with salt master
INSTANCE_PREFIX={YOUR-ID-HERE}
INSTANCE_ID=$(curl http://169.254.169.254/latest/meta-data/instance-id);

# Change hostnames on VM
echo $INSTANCE_PREFIX-$INSTANCE_ID > /etc/hostname;
sed -i -e '/^127.0.0.1/d' /etc/hosts; 
sed -i -e '/^::1/d' /etc/hosts; 
echo 127.0.0.1 $INSTANCE_PREFIX-$INSTANCE_ID >> /etc/hosts;

# Install and bootstrap salt-minion to saltmaster
SALT_MASTER_IP={IP-TO-SALT-MASTER-HERE}
mkdir -p /etc/salt/; $INSTANCE_PREFIX-$INSTANCE_ID > /etc/salt/minion_id;
sudo curl -o /tmp/bootstrap-salt.sh -L https://bootstrap.saltstack.com;
sudo sh /tmp/bootstrap-salt.sh -i $INSTANCE_PREFIX-$INSTANCE_ID -A $SALT_MASTER_IP;
sudo rm -f /tmp/bootstrap-salt.sh;