### Add branch
``` git
git branch <new branch>
```
### Switch branch
``` git
git checkout <branch>
```
### Remove branch
``` git
git branch -D <branch>
```
### Remove remote branch
``` git
git fetch -p origin #Fetch newest branch from remote repository.
git push origin --delete <branch>
```

Branch | Description
--|--
git branch -l | show local branch
git branch -r | show remote branch
git branch -a | show both local and remote branch