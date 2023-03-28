#bin/bash
sudo sed '/PermitRootLogin = yes/d' /etc/ssh/sshd_config > sshd_config
sudo cp sshd_config /etc/ssh/sshd_config
sudo /etc/init.d/ssh restart
sudo chown root:root /etc/ssh/sshd_config

