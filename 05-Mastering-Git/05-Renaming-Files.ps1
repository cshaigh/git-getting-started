# make menu.txt a markdown file
Move-Item .\menu.txt .\menu.md

Get-ChildItem
<#

        Directory: F:\dev\cookbook


    Mode                LastWriteTime         Length Name
    ----                -------------         ------ ----
    d-----       15/09/2018     13:25                recipes
    -a----       15/09/2018     13:25             71 menu.md

#>

# git status shows that there is a file in the working area that's not in the index and a file in the index not in the working area
git status
<#

    On branch master
    Changes not staged for commit:
    (use "git add/rm <file>..." to update what will be committed)
    (use "git checkout -- <file>..." to discard changes in working directory)

            deleted:    menu.txt

    Untracked files:
    (use "git add <file>..." to include in what will be committed)

            menu.md

    no changes added to commit (use "git add" and/or "git commit -a")

#>

# add menu.md to index and verify
git add .\menu.md
git status
<#

    On branch master
    Changes to be committed:
    (use "git reset HEAD <file>..." to unstage)

            new file:   menu.md

    Changes not staged for commit:
    (use "git add/rm <file>..." to update what will be committed)
    (use "git checkout -- <file>..." to discard changes in working directory)

            deleted:    menu.txt

#>

# add menu.txt (null) to index and verify
git add .\menu.txt

# git now figures out that menu.txt -> menu.md because it compared contents (hashes)
git status
<#

    On branch master
    Changes to be committed:
    (use "git reset HEAD <file>..." to unstage)

            renamed:    menu.txt -> menu.md

#>

# add working area + index changes to repository; verify clean status
git commit --message "Use Markdown for the menu"
<#

    [master e733ef5] Use Markdown for the menu
    1 file changed, 0 insertions(+), 0 deletions(-)
    rename menu.txt => menu.md (100%)

#>
git status
<#

    On branch master
    nothing to commit, working tree clean

#>

# single-shot operation to Move-Item, git add x 2
git mv .\menu.md .\menu.txt

git status
<#

    On branch master
    Changes to be committed:
    (use "git reset HEAD <file>..." to unstage)

            renamed:    menu.md -> menu.txt

#>

# commit mind change and verify clean status
git commit --message "Well, I changed my mind about that renaming"
<#

    [master 48aba0c] Well, I changed my mind about that renaming
    1 file changed, 0 insertions(+), 0 deletions(-)
    rename menu.md => menu.txt (100%)

#>

git status
<#

    On branch master
    nothing to commit, working tree clean

#>