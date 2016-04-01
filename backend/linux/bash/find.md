### find

### Find folder or file by name
```bash
find / -name httpd*            #Find all files and folders begin with httpd
find / -type d -name httpd*    #Find directories begin with httpd
find / -type f -name httpd*    #Find files begin with httpd
```

### Find file or directories by type and execute chmod command 
```bash

find . -type f -exec chmod 644 {} \;
find . -type d -exec chmod 755 {} \; 

find . -type f -exec chmod 400 {} \;
find . -type d -exec chmod 500 {} \; 
find var/ -type f -exec chmod 600 {} \; 
find media/ -type f -exec chmod 600 {} \;
find var/ -type d -exec chmod 700 {} \; 
find media/ -type d -exec chmod 700 {} \;
```