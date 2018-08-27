git graphlog

# fetch from origin master
git fetch "origin" "master"

# nothing came down
git graphlog

# push changes back up to tracked remote repo (already configured as origin/master)
git push

# origin/master remote has now been fast-forwarded to the same point as the current master
git graphlog

# expose v1.0_fixes branch
git push "origin" "v1.0_fixes"

# This can now be seen as a branch on the remote GitHub repository

# list remote branches
git branch --remotes