# My Github cheat sheet

## commons
git add .
git commit -m "yyyymmdd -xx comments"
git push origin master/main

git pull

git merge

## toss out everything and get from master
git reset --hard origin/master

## git pull and discard local changes
If you want remove all local changes - including files that are untracked by git - from your working copy, simply stash them:

git stash push --include-untracked

If you don't need them anymore, you now can drop that stash:

git stash drop

## removing cached creds (MacOS)
git config --global --unset user.password

## which git repo
git remove -v

## notes
- 2FA now enabled
- Use PAT (Personal Access Token) as pwd


## rebase history
git filter-branch --index-filter 'git rm -r --cached --ignore-unmatch files/workday workday_workers_20210322_233215_393292.txt' HEAD
### force option
git filter-branch --index-filter -f 'git rm -r --cached --ignore-unmatch files/workday workday_workers_20210322_233215_393292.txt' HEAD

git pull --rebase

## rebase (ghost large file; annoying)
git filter-branch --force --index-filter 'git rm --cached --ignore-unmatch brightoaks/fullsite_backup/backup-12.22.2010_23-03-18_thebrigh.tar.gz' --prune-empty --tag-name-filter cat -- --all

git pull --rebase


# useful urls
- https://medium.com/@ginnyfahs/github-error-authentication-failed-from-command-line-3a545bfd0ca8
