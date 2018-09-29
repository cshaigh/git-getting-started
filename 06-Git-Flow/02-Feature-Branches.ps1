# git-flow makes it easy to work on multiple features at the same time by using feature branches.

# Create a new git flow feature branch - 'authentication'
git flow feature start authentication
<#

    Switched to a new branch 'feature/authentication'

    Summary of actions:
    - A new branch 'feature/authentication' was created, based on 'develop'
    - You are now on branch 'feature/authentication'

    Now, start committing on your feature. When done, use:

        git flow feature finish authentication

#>

# verify current branch
git branch
<#

    develop
    * feature/authentication
    master

#>

# make some changes to this branch
Set-Content .\authentication.txt "This is a placeholder for something better on authentication"

# stage, commit and verify
git add .\authentication.txt
git commit --message "Add authentication."
<#

    [feature/authentication b685304] Add authentication.
    1 file changed, 1 insertion(+)
    create mode 100644 authentication.txt

#>

git log --decorate --graph --oneline
<#

    * b685304 (HEAD -> feature/authentication) Add authentication.
    * b6aff2b (master, develop) Initial commit

#>

# When you're finished, use feature finish
git flow feature finish authentication
<#

    Switched to branch 'develop'
    Updating b6aff2b..b685304
    Fast-forward
    authentication.txt | 1 +
    1 file changed, 1 insertion(+)
    create mode 100644 authentication.txt
    Deleted branch feature/authentication (was b685304).

    Summary of actions:
    - The feature branch 'feature/authentication' was merged into 'develop'
    - Feature branch 'feature/authentication' has been locally deleted
    - You are now on branch 'develop'

#>

# Your feature branch will be merged and you're taken back to your develop branch.
# Internally, git-flow used git merge --no-ff feature/authentication to make sure you didn't lose any historical information about your feature branch before it was removed.

# verify in log
git log --decorate --graph --oneline
<#

    * b685304 (HEAD -> develop) Add authentication.
    * b6aff2b (master) Initial commit

#>