# don't want the v1.0_fixes remote branch any more, so will delete (USE CAUTION!)

# push v1.0_fixes branch to origin as v1.0_fixes_remote_branch_name
git push "origin" "v1.0_fixes:v1.0_fixes_remote_branch_name"

# to delete branch remotely, instruct git to push <nothing> to origin as v1.0_fixes_remote_branch_name
# (overwriting existing remote branch)
git push origin ":v1.0_fixes_remote_branch_name"

# also delete v1.0_fixes
git push origin ":v1.0_fixes"

# see how they're now gone
git branch --remotes