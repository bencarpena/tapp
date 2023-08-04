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


## merge adf_collaborate to main
git clone <repo>
git branch 
git checkout main
git merge adf_collaborate
>Error
git pull origin adf_collaborate --allow-unrelated-histories
git status
sh gitupload.sh


## overwrite local changes
>Scenario: I worked on my personal Mac. I then want to get the changes from Git into my work Mac.
git fetch --all
git reset --hard origin/main
git pull

## Please tell me who you are
`git config --global user.email "someone@gmail.com"`
Or if you want only for local repo
`git config user.email "someone@gmail.com"`
Then proceed with git ops


## Ignoring files
From local repo:
`touch .gitignore` 

Open .gitignore and enter files to ignore:
- https://docs.github.com/en/get-started/getting-started-with-git/ignoring-files
- https://gist.github.com/octocat/9257657

Example:
`utils/lihim.py`
`*.class`

>But if file is already checked in and you want to ignore it, run:
`git rm --cached FILENAME`


## git authentication with PAT (bypass prompts at Raspi)
> Notes: <br>
`type -p curl >/dev/null || (sudo apt update && sudo apt install curl -y)
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y`

> Run : `gh auth login`