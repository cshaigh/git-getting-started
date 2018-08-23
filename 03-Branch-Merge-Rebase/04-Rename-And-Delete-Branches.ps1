git checkout "master"

# move fix1 branch to bug1234
git branch --move "fix1" "bug1234"

# has been easily renamed
git graphlog

# try to delete stupid branch (error: The branch 'bug1234' is not fully merged.)
git branch --delete "bug1234"

# force deletion
git branch --delete --force "bug1234"

# create feature2 branch + switch to it
git checkout -b "feature2"

Write-Output "Feature2" >> .\readme.md

git commit --all --message "Added feature2"

git graphlog