# branch - a pointer to the latest commit in a branch
# tag - a friendly name for a specific commit at a point in time

# switch back to master
git checkout "master"

# show graphlog.  HEAD is now pointing to second item down (latest commit in master)
git graphlog

# create fix branch based on specific commit bbc25b4
git branch "fix1" "bbc25b4"

git checkout "fix1"

Write-Output "Fixing bug#1234" >> .\readme.md

git commit --all --message "Fixed bug#1234"

git graphlog