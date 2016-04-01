### Crontab format
```bash
cat /etc/crontab
# For details see man 4 crontabs
# Example of job definition:
# .---------------- minute (0 - 59)
# |  .------------- hour (0 - 23)
# |  |  .---------- day of month (1 - 31)
# |  |  |  .------- month (1 - 12) OR jan,feb,mar,apr ...
# |  |  |  |  .---- day of week (0 - 6) (Sunday=0 or 7) OR sun,mon,tue,wed,thu,fri,sat
# |  |  |  |  |
# *  *  *  *  * user-name command to be executed
```

### Crontab commands
```bash
crontab -l                  #List all task
crontab -e                  #Edit crontab
tail -f /var/log/cron       #Debug crontab, show which task is running
```

### Examples
```crontab
0 0 * * * cd /home/example_user;./myjob.sh  > /var/log/myjob.log 2>&1
*/5 * * * * cd /home/example_user;./myjob.sh  > /var/log/myjob.log 2>&1
*/1 * * * * /usr/local/bin/php /home/example_user/public_html/myjob.php  > /var/log/myjob.log 2>&1
```