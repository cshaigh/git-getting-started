# create feature branch
git branch feature1

# switch to this feature branch
git checkout feature1

git graphlog

# add some feature1 work
Write-Output "Feature1" >> .\readme.md

git status

# commit this
git commit --all --message "Added feature1"

git graphlog