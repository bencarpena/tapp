# GitHub Account Setup (Workspace)
> setup done at mac mini : ALFRED

This workspace is configured to manage two separate GitHub accounts: **main** (`bencarpena`) and **play** (`alfredsilvertonai`).

## 1. Add SSH Keys to GitHub

You must add the following public keys to their respective GitHub accounts under **Settings > SSH and GPG keys**.

### Account: main (bencarpena)
- **Email:** bencarpena@gmail.com
- **SSH Key:**
```text
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIK1AKIfNjw1TArXjnBvlyj6FkLFa5LD839HaHmixpxVT bencarpena@gmail.com
```

### Account: play (alfredsilvertonai)
- **Email:** alfred.silverton.ai@gmail.com
- **SSH Key:**
```text
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHss1GYVvVlcZOhoQAZm9YdXkBTgkwjfdUfDtCKp49s9 alfred.silverton.ai@gmail.com
```

---

## 2. Configuration Details

### SSH Config (`~/.ssh/config`)
The SSH configuration uses custom host aliases to route traffic to the correct identity:
- `github.com-bencarpena` (uses `~/.ssh/id_ed25519_bencarpena`)
- `github.com-alfredsilverton` (uses `~/.ssh/id_ed25519_alfredsilverton`)

### Git Config (`~/.gitconfig`)
The global Git configuration uses `includeIf` directives to automatically set your `user.name` and `user.email` based on the folder you are working in.

---

## 3. How to Clone Repositories

To clone a repository so it sits in its own subfolder (e.g., `main/repo-name`), use these commands:

### For the `main` folder (bencarpena):
```bash
# 1. Enter the main folder
cd /Users/gojo/Workspace/main

# 2. Clone using the custom host (DO NOT add a dot at the end)
git clone git@github.com-bencarpena:bencarpena/<repo-name>.git
git clone git@github.com-bencarpena:bencarpena/tapp.git
git clone git@github.com-bencarpena:bencarpena/gems.git
```

### For the `play` folder (alfredsilvertonai):
```bash
# 1. Enter the play folder
cd /Users/gojo/Workspace/play

# 2. Clone using the custom host (DO NOT add a dot at the end)
git clone git@github.com-alfredsilverton:alfredsilvertonai/<repo-name>.git
```

### For the `business` folder (bschwarzchild):
cd ~/Workspace/business
git clone git@github.com-business:<org-or-user>/<repo-name>.git
git clone git@github.com-business:bschwarzchild/velocity.git

---

## 4. Verification

After adding the keys to GitHub, you can test the connections:

```bash
# Test main account
ssh -T git@github.com-bencarpena

# Test play account
ssh -T git@github.com-alfredsilverton
```
