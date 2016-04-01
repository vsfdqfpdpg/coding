## Tuning apache 
### Referance Source
* [Locate httpd config file](http://www.commanigy.com/blog/2011/6/8/finding-apache-configuration-file-httpd-conf-location)
* [Ttuning apache maxclients](https://serverfault.com/questions/644622/tuning-apache2-prefork-maxclients-serverlimit)
* [apache2buddy](https://raw.githubusercontent.com/richardforth/apache2buddy/master/apache2buddy.pl)
```bash
# Get httpd configuration file's location 
APACHE_BIN=`ps -ef | grep httpd | awk '{print $8}' | grep -v grep| awk 'NR==1{print $1}'`
HTTPD_ROOT=`$APACHE_BIN -V | grep HTTPD_ROOT | awk 'NR==1{print $2}' | awk -F= '{print $2}'`
SERVER_CONFIG_FILE=`$APACHE_BIN -V | grep SERVER_CONFIG_FILE | awk 'NR==1{print $2}' | awk -F= '{print $2}'`
echo $HTTPD_ROOT/$SERVER_CONFIG_FILE | awk '{gsub(/\"/,"")}; 1'
```

### Edit the configrution file
> $ vi /usr/local/apache/conf/httpd.conf  
> $ vi /etc/httpd/conf/httpd.conf

```apache
<IfModule mpm_prefork_module>
    StartServers       8        #30% of MaxClients
    MinSpareServers    5        #5% of MaxClients
    MaxSpareServers   20        #10% of MaxClients
    ServerLimit      256        #ServerLimit == MaxClients
    MaxClients       256
    MaxRequestsPerChild  10000
</IfModule>
Timeout   60 
KeepAlive On
KeepAliveTimeout 15
MaxKeepAliveRequests 1000
```
### apache2buddy
```bash
export PATH=$PATH:/usr/local/apache/bin
wget http://apache2buddy.pl/ -O apache2buddy.pl
chmod +x apache2buddy.pl
```

### Live Performance monitoring of HTTP Server
```apache
LoadModule info_module modules/mod_info.so
LoadModule status_module modules/mod_status.so
ExtendedStatus on
<Location /server-status>
    Sethandler server-status
    order allow,deny
    allow from 192.168.0.19
</Location>
<Location /server-info>
    Sethandler server-info
    order allow,deny
    allow from 192.168.0.19
</Location>
```

### Other Commands
```bash
/usr/local/apache/bin/apachectl -l      #View loaded moudles
/usr/local/apache/bin/apachectl -t      #Test httpd Syntax
ps -aux|grep httpd                      #Show all httpd processes
netstat -tnl                            #List all listening port
```