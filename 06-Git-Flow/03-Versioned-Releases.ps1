# If you need tagges and versioned releases, you can use git-flow's release branches to start a new branch when you're ready to deploy a new version to production.
# Like everything else in git-flow, you don't have to use release branches if you don't want to.
# Prefer to manually git merge --no-ff develop into master without tagging?  No problem.
# However, if you're working on a versioned API or library, release branches might be really useful and they work exactly like you'd expect.
git status
<#

    On branch develop
    nothing to commit, working tree clean

#>

git flow release start 0.1.0
<#

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

git flow release finish 0.1.0
<#

    Switched to branch 'master'
    Merge made by the 'recursive' strategy.
    authentication.txt | 1 +
    1 file changed, 1 insertion(+)
    create mode 100644 authentication.txt
    Already on 'master'
    Switched to branch 'develop'
    Already up to date!
    Merge made by the 'recursive' strategy.
    Deleted branch release/0.1.0 (was b685304).

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

    *   7369394 (HEAD -> develop) Merge tag '0.1.0' into develop
    |\
    | *   487090e (tag: 0.1.0, master) Merge branch 'release/0.1.0'
    | |\
    | |/
    |/|
    * | b685304 Add authentication.
    |/
    * b6aff2b Initial commit

#>

# You're still on master, so you can deploy before going back to your develop branch, which git-flow made sure to update with the release changes in master