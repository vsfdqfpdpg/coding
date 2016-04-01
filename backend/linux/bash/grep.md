### grep
```bash
#Finding files includes styles.css within /var/www/html/cache/* folder and then delete
grep -lr 'styles.css' /var/www/html/*  | xargs rm
grep -lr 'styles.css' /usr/share/nginx/html/*  | xargs rm
ps -aux | grep httpd            #Show all httpd processes
```