# Look at the log and decide what we're not happy with in the previous commit...
git log

# Revert to previous commit...
git reset --soft HEAD~1

# "Reorganised the feature" now taken out of the repo...
git log

# Can be seen as a staged change in the WC...
git status

# Re-commit "Reorganised files for feature"
git commit --message "Reorganised files for feature"

# Now a part of the log...
git log

# "Hard" revert a commit (erase from history): -

# Get rid of most recent commit completely...
git reset --hard HEAD~1

# Nothing staged in WC...
git status

# Commit is gone from log...
git log
