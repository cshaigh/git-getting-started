git checkout "feature2"

Write-Output "Feature2 changes" >> .\readme.md

git status

# need to stash (shelve) these changes to later
git stash

# now recent changes have been stashed.  Nothing to see in status
git status

# see what's in the git stash
git stash list

# switch to bug1234 branch and fix a bug
git checkout "bug1234"

Write-Output "Another fix to Bug#1234" >> .\readme.md

git commit --all --message "Really fixing Bug#1234"

# let's go back to feature2 and reapply my stashed changes
git checkout "feature2"

git stash apply

Get-Content .\readme.md

# the stash is still in the list
git stash list

git reset --hard "HEAD"

git status

Get-Content .\readme.md

# pop top stash onto working copy, taking it off the stash list
git stash pop

# re-stash things
git stash

Write-Output "More changes" > .\additional_file.txt

git status

# add to git and stash
git add .\additional_file.txt

git stash

git status

# now there are 2 pending changes in the stash
git stash list

# create new branch from stash
git stash branch "feature2_additional"

# get stash list again (top of stash has been removed cos it was converted to a branch)
git stash list

git commit --all --message "Added additional features to feature2"

git graphlog