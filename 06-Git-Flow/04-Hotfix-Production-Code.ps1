# Because you keep your master branch always in sync with the code that's on production, you'll be able to quickly fix any issues on production.
# For example, if your assets aren't loading on production, you'd roll back your deploy and start a hotfix branch
git flow hotfix start assets
<#

    Switched to a new branch 'hotfix/assets'

    Summary of actions:
    - A new branch 'hotfix/assets' was created, based on 'master'
    - You are now on branch 'hotfix/assets'

    Follow-up actions:
    - Start committing your hot fixes
    - Bump the version number now!
    - When done, run:

        git flow hotfix finish 'assets'

#>

# Hotfix branches are a lot like release branches, except they're based on master instead of develop.
# You're automatically switched to the new hotfix branch so you can start fixing the issue and bumping the minor version number.
Set-Content .\assets.txt "This is a placeholder for an assets hotfix"

git add .\assets.txt
git commit --message "Hotfix production error with assets"

# When you're done, hotfix finish
git flow hotfix finish assets
<#

    Switched to branch 'master'
    Merge made by the 'recursive' strategy.
    assets.txt | 1 +
    1 file changed, 1 insertion(+)
    create mode 100644 assets.txt
    Switched to branch 'develop'
    Merge made by the 'recursive' strategy.
    assets.txt | 1 +
    1 file changed, 1 insertion(+)
    create mode 100644 assets.txt
    Deleted branch hotfix/assets (was f477548).

    Summary of actions:
    - Hotfix branch 'hotfix/assets' has been merged into 'master'
    - The hotfix was tagged 'assets'
    - Hotfix tag 'assets' has been back-merged into 'develop'
    - Hotfix branch 'hotfix/assets' has been locally deleted
    - You are now on branch 'develop'

#>

# Like when finishing a release branch, the hotfix branch gets merged into both master and develop.
# The release is tagged and the hotfix branch is removed.