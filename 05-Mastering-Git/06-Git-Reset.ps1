<#

Commands that move branches

    git commit  // creates a new commit and moves the current branch to point at the new commit
    git merge   // creates a new commit (in most cases) and moves the current branch to point at the new commit
    git rebase  // creates new commits by copying existing commits and moves the current branch to point at one of these new commits
    git pull    // gets new commits from a remote and updates local or remote branches

#>

# git reset moves the current branch and optionally copies data from the repository to the other areas.

<#

    git reset | git reset --mixed   // default option: resets the index but not the working tree
    git reset --soft                // resets the HEAD to a commit but doesn't touch the index or working tree
    git reset --hard                // resets the index and working tree.  Any changes to tracked files in the working tree since the commit are discarded.

#>

## EXAMPLE 1 - crappy strawberry squids recipe ##

# make a change, stage in the index, then commit to repository
Add-Content .\menu.txt "Stawberry Squids"

git add .\menu.txt

git status

git commit --message "Add strawberry squids to menu"

# verify in log
git log --oneline
<#

    fa852cd (HEAD -> master) Add strawberry squids to menu
    48aba0c Well, I changed my mind about that renaming
    e733ef5 Use Markdown for the menu
    d547b52 Add Tikka Masala to menu
    022ba96 (tag: dinner, spaghetti) Add carbonara ingredients
    f6ac104 Add spaghetti alla carbonara
    f6effc9 (lisa) Merge branch 'lisa'
    196735c Add Lisa's version of the pie
    19a9e91 Added recipe
    3928bee (tag: mytag) Add cake
    e79f317 First commit!

#>

# The above process has created a new commit in the repository containing a new version of menu.txt and the same version of recipes directory

# Add Strawberry Squids recipe
Add-Content .\recipes\strawberry_squids.txt "1 Kg fresh squids"
Add-Content .\recipes\strawberry_squids.txt "1 can strawberry jam"

# stage and commit this
git add .\recipes
git commit --message "Add placeholder recipe for squids"
<#

    [master 581653a] Add placeholder recipe for squids
    1 file changed, 2 insertions(+)
    create mode 100644 recipes/strawberry_squids.txt

#>

# git has created a new commit which references the previous unchanged menu.txt and new recipes directory
git log --oneline
<#

    581653a (HEAD -> master) Add placeholder recipe for squids
    fa852cd Add strawberry squids to menu
    48aba0c Well, I changed my mind about that renaming
    e733ef5 Use Markdown for the menu
    d547b52 Add Tikka Masala to menu
    022ba96 (tag: dinner, spaghetti) Add carbonara ingredients
    f6ac104 Add spaghetti alla carbonara
    f6effc9 (lisa) Merge branch 'lisa'
    196735c Add Lisa's version of the pie
    19a9e91 Added recipe
    3928bee (tag: mytag) Add cake
    e79f317 First commit!

#>

# turns out this is a terrible idea - let's get strawberry squids out of the repo!
# i.e. reset current branch to a previous commit

# reset working area, index and repo (--hard) to commit 48aba0c (before strawberry squids)
git reset --hard 48aba0c
<#

    HEAD is now at 48aba0c Well, I changed my mind about that renaming

#>

# current branch (and HEAD) is now at commit 48aba0c
git log --oneline
<#

    8aba0c (HEAD -> master) Well, I changed my mind about that renaming
    e733ef5 Use Markdown for the menu
    d547b52 Add Tikka Masala to menu
    022ba96 (tag: dinner, spaghetti) Add carbonara ingredients
    f6ac104 Add spaghetti alla carbonara
    f6effc9 (lisa) Merge branch 'lisa'
    196735c Add Lisa's version of the pie
    19a9e91 Added recipe
    3928bee (tag: mytag) Add cake
    e79f317 First commit!

#>

<# these commits will now eventually be garbage collected: -

    581653a (HEAD -> master) Add placeholder recipe for squids
    fa852cd Add strawberry squids to menu

#>

# EXAMPLE 2 #
# Add BBQ to cookbook, stage in index
Add-Content .\menu.txt "BBQ"
git add .\menu.txt

# Changed my mind; either of these commands will unstage (remove from index) this change: -
git rm --cached .\menu.txt

# default reset option is --mixed, i.e. unstage / remove from index
# literally reset index to HEAD (current commit in repo)
git reset HEAD .\menu.txt
<#

    Unstaged changes after reset:
    M       menu.txt

#>

# cancel everything - copy current commit (HEAD) in repo into index and working area
git reset --hard HEAD
<#

    HEAD is now at 48aba0c Well, I changed my mind about that renaming

#>