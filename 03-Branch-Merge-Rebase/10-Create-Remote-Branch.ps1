git graphlog

# fetch from origin master
git fetch "origin" "master"

# nothing came down
git graphlog

# push changes back up to tracked remote repo (already configured as origin/master)
git push

# origin/master remote has now been fast-forwarded to the same point as the current master
git graphlog