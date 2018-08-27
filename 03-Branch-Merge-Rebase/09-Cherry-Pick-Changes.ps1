# create a v1.0_fixes branch based on v1.0 tag
git branch "v1.0_fixes" "v1.0"

git checkout "v1.0_fixes"

Write-Output "Fix1" >> .\file3.txt

git commit --all --message "Added Fix1"

Write-Output "Fix2" >> .\file2.txt

git add .\file2.txt
git commit --all --message "Added Fix2"

git graphlog

# we want to cherry-pick one of our v1.0_fixes into the master branch
git checkout "master"

# can't do a merge - just want to grab Fix1; can't do a rebase - would be applying entire branch
# let's use git cherry-pick
git graphlog

# cherry-pick Fix1's commit hash (7180b14)
git help cherry-pick

git diff --cached

git cherry-pick --continue