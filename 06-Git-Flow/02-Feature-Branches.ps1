# git-flow makes it easy to work on multiple features at the same time by using feature branches.

# Create a new git flow feature branch - 'authentication'
git flow feature start authentication --showcommands
<#

    git config --local gitflow.branch.feature/authentication.base develop
    git checkout -b feature/authentication develop
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

    [feature/authentication 0abd8a1] Add authentication.
    1 file changed, 1 insertion(+)
    create mode 100644 authentication.txt

#>

git log --decorate --graph --oneline
<#

    * 0abd8a1 (HEAD -> feature/authentication) Add authentication.
    * 662c0bd (master, develop) Initial commit

#>

# When you're finished, use feature finish
git flow feature finish authentication --showcommands
<#

    git checkout develop
    Switched to branch 'develop'
    git merge --ff feature/authentication
    Updating 662c0bd..0abd8a1
    Fast-forward
    authentication.txt | 1 +
    1 file changed, 1 insertion(+)
    create mode 100644 authentication.txt
    git branch -d feature/authentication
    Deleted branch feature/authentication (was 0abd8a1).

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

    * 0abd8a1 (HEAD -> develop) Add authentication.
    * 662c0bd (master) Initial commit

#>