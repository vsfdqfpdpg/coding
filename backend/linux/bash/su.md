### su
```bash
su - example_user                   # Switch to user example_user
su example_user -c "cd ~;ls -al;"   # Using example_user to excute command
# Uing example_user excute command with specific bash
su example_user -c "cd ~;ls -al;" -s '/bin/bash' 
```

### Examples
```bash
su - nginx -c 'ulimit -aHS' -s '/bin/bash'
su - nginx -c 'ulimit -n' -s '/bin/bash'
```