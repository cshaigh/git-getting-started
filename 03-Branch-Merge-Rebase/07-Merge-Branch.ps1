<# types of merges: -

Type            Description
----            -----------

Fast-forward    if no changes happen in the master branch
Merge-commit    where changes have been made to the master branch, conflicts will need to be resolved
Rebase          change/de-clutter history and pretend that changes have been made in the destination branch

#>

git graphlog

# time to merge in feature1 (git performs a fast-forward merge becaust it could move the HEAD label to the new point)
git merge "feature1"

# confirm the above
git graphlog

# now it's been merged, we can delete the feature1 branch
git branch --delete "feature1"

git graphlog

# merge in feature2_additional (automatic merge fails - conflicts must be resolved)
git merge "feature2_additional"

Get-Content .\readme.md

# resolve conflicts with installed diff tool (vsdiffmerge)
git mergetool

# compare repo with staging area
git diff --cached

# commit merge
git commit --message "Merged feature2_additional into master"

# clean up .orig file
Remove-Item .\readme.md.orig