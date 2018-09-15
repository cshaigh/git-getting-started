Add-Content .\menu.txt "Chicken Tikka Masala"

Get-Content .\menu.txt
<#

    Spaghetti alla Carbonara
    Apple Pie
    Cheesecake
    Chicken Tikka Masala

#>

# .\menu.txt has been changed but not staged yet
git status
<#

    On branch master
    Changes not staged for commit:
    (use "git add <file>..." to update what will be committed)
    (use "git checkout -- <file>..." to discard changes in working directory)

            modified:   menu.txt

    no changes added to commit (use "git add" and/or "git commit -a")

#>

# copy .\menu.txt from working area to index
git add .\menu.txt

# verify that .\menu.txt is now staged (in the index)
git status
<#

    On branch master
    Changes to be committed:
    (use "git reset HEAD <file>..." to unstage)

#>

# no difference cos working area == index (is staged)
git diff

# however, there are changes between index and repository
git diff --cached
<#

    diff --git a/menu.txt b/menu.txt
    index 92c4f46..e4053e4 100644
    --- a/menu.txt
    +++ b/menu.txt
    @@ -1,3 +1,4 @@
    Spaghetti alla Carbonara
    Apple Pie
    Cheesecake
    +Chicken Tikka Masala

#>

# copy updated file from index to repository (among many other things!)
git commit --message "Add Tikka Masala to menu"
<#

    [master d547b52] Add Tikka Masala to menu
    1 file changed, 1 insertion(+)

#>

# verify that working area, index and repo aligned
git status
<#

    On branch master
    nothing to commit, working tree clean

#>
git diff
git diff --cached