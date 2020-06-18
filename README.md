# dotfiles

## syncing with [`rsync`](https://rsync.samba.org/)

```sh
rsync -avv --exclude=.git/ --exclude=.DS_Store --exclude=other/ --exclude=README.md . ~
```

