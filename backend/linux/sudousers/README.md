## Centos add sudo users
### Reference Resources
* [Securing your server](https://www.linode.com/docs/security/securing-your-server)
* [Configuring SSHD on the Server](https://serversforhackers.com/video/configuring-sshd-on-the-server)
1. Modifiy sudoers file  
This file is read only. When saving this file type command below in vi command mode
> w !sudo tee % 
```bash

vi /etc/sudoers
%wheel  ALL=(ALL)       ALL
```
2. Add user
```bash
useradd example_user && passwd example_user
usermod -aG wheel example_user
su - example_user -c 'cd ~;mkdir -p /home/example_user/.ssh; chmod 700 /home/example_user/.ssh;'
```

3.1 Create an Authentication Key-pair
```bash
su example_user
ssh-keygen -b 4096   #Generate ssh key-pair
# .ssh folder need 700 permission. 
# authorized_keys file need 600 permission. 
cd /home/example_user/.ssh
touch authorized_keys
chmod 600 authorized_keys
cat id_rsa.pub > authorized_keys # copy public key to authorized_keys
```

3.2 Upload id_rsa.pub to server
```cmd
pscp -P 22 D:\id_rsa.pub example_user@127.0.0.1:/home/example_user/.ssh/authorized_keys
chmod 600 /home/example_user/.ssh/authorized_keys
chown example_user.example_user /home/example_user/.ssh/authorized_keys
```

4 Download id_rsa private key to localhost
```bash
pscp -P 22 example_user@127.0.0.1:/home/example_user/.ssh/id_rsa C:\Users\Administrator\Desktop
id_rsa ->puttygen ->load -> save private key -> putty -> Connection -> SSH -> Auth
```

5 Edit ssh config file
```bash
vi /etc/ssh/sshd_config 
Port 22
PermitRootLogin no
PasswordAuthentication no
```
6 Restart sshd service 
```bash
service sshd restart
```