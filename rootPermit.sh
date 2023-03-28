#bin/bash
test=$(whoami) 
sudo chown $test:$test /etc/ssh/sshd_config
echo "PermitRootLogin = yes" >> /etc/ssh/sshd_config
sudo /etc/init.d/ssh restart


