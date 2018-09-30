# If you need tagges and versioned releases, you can use git-flow's release branches to start a new branch when you're ready to deploy a new version to production.
# Like everything else in git-flow, you don't have to use release branches if you don't want to.
# Prefer to manually git merge --no-ff develop into master without tagging?  No problem.
# However, if you're working on a versioned API or library, release branches might be really useful and they work exactly like you'd expect.
git status
<#

    On branch develop
    nothing to commit, working tree clean

#>

git flow release start 0.1.0 --showcommands
<#

    git config --local gitflow.branch.release/0.1.0.base develop
    git checkout -b release/0.1.0 develop
    Switched to a new branch 'release/0.1.0'

    Summary of actions:
    - A new branch 'release/0.1.0' was created, based on 'develop'
    - You are now on branch 'release/0.1.0'

    Follow-up actions:
    - Bump the version number now!
    - Start committing last-minute fixes in preparing your release
    - When done, run:

        git flow release finish '0.1.0'

#>

git branch
<#

    develop
    master
    * release/0.1.0

#>

# Bump the version number and do everything that's required to release your project in the release branch.
# If you do any last-minute fixes, git-flow will make sure everything is correctly merged into both master and develop.

# Then, finish the release:

git flow release finish 0.1.0 --showcommands
<#

    git checkout master
    Switched to branch 'master'
    git merge --no-ff release/0.1.0
    Merge made by the 'recursive' strategy.
    authentication.txt | 1 +
    1 file changed, 1 insertion(+)
    create mode 100644 authentication.txt
    git checkout master
    Already on 'master'
    git tag -a 0.1.0
    git checkout develop
    Switched to branch 'develop'
    git merge --no-ff 0.1.0
    Already up to date!
    Merge made by the 'recursive' strategy.
    git branch -d release/0.1.0
    Deleted branch release/0.1.0 (was 0abd8a1).

    Summary of actions:
    - Release branch 'release/0.1.0' has been merged into 'master'
    - The release was tagged '0.1.0'
    - Release tag '0.1.0' has been back-merged into 'develop'
    - Release branch 'release/0.1.0' has been locally deleted
    - You are now on branch 'develop'

#>

# Boom!  git-flow pulls from origin, merges the release branch into master, tags the release and back-merges everything back into develop before removing the release branch.
git log --decorate --graph --oneline
<#

    *   8797a05 (HEAD -> develop) Merge tag '0.1.0' into develop
    |\
    | *   7eb3fbc (tag: 0.1.0, master) Merge branch 'release/0.1.0'
    | |\
    | |/
    |/|
    * | 0abd8a1 Add authentication.
    |/
    * 662c0bd Initial commit

#>

# You're still on master, so you can deploy before going back to your develop branch, which git-flow made sure to update with the release changes in master