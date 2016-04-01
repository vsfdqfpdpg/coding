#### Resource
[Undo](http://blog.csdn.net/revitalizing/article/details/51337592)

### Undo git add
``` git
$ git reset HEAD <file>    #undo <file> added to cache 
$ git checkout -- <file>   #undo file from command "git rm <file>"  
``` 
### Undo git commit
``` git
$ git reset --soft <commit_id>
$ git reset --hard <commit_id>
````

### Restore all fiels and override local repository.
``` git
$ git fetch origin   
$ git reset --hard origin/master
```

### Restore all fiels but not override local repository.
``` git
$ git pull origin master  
$ git reset --hard origin/master
```