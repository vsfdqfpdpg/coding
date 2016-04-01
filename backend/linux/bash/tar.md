## tar

### zip
```bash
# The zipped file names zip.gz
# exclude folders [cache,log]
# exclude all files ended wiht zip and gz
tar -czvf zip.gz --exclude=cache --exclude=log --exclude=*.zip --exclude=*.gz  .
```

### unzip
```bash
tar -xzvf zip.gz
```