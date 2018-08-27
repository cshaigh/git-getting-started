# create feature3 branch based off v1.0 tag
git branch "feature3" "v1.0"
git checkout "feature3"

Write-Output "Adding yet more code" >> file1.txt

git add .\file1.txt

git commit --all --message "Added feature3"

git graphlog

git show "feature3"

# re-map feature3 commits onto master
git rebase "master"

git graphlog

git checkout "master"

# merge in feature3 (fast-forward AKA move pointer)
git merge "feature3"

git graphlog

# when rebases go wrong
git checkout "bug1234"

git rebase "master"

Get-Content .\readme.md

git mergetool

# continue with our rebasing (more conflicts)
git rebase --continue

# more conflicts!  need to fix those too
git mergetool

git rebase --continue

# no more conflicts, but still dirty files left behind
git status
Remove-Item .\readme.md.orig

git graphlog

# merge in bug1234 branch
git checkout "master"

git merge "bug1234"

git graphlog

git branch --delete "bug1234" "feature2" "feature2_additional" "feature3"

git merge "bug1234"

git graphlog