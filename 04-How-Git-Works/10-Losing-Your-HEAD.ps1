# git checkout: move HEAD pointer to a specific commit

# move HEAD to latest master commit
git checkout master

# find a specific commit
git log --oneline
<#

    f6effc9 (HEAD -> master, lisa) Merge branch 'lisa'
    196735c Add Lisa's version of the pie
    19a9e91 Added recipe
    3928bee (tag: mytag) Add cake
    e79f317 First commit!

#>

# checkout a specific commit (detached HEAD)
git checkout f6effc9
<#

    Note: checking out 'f6effc9'.

    You are in 'detached HEAD' state. You can look around, make experimental
    changes and commit them, and you can discard any commits you make in this
    state without impacting any branches by performing another checkout.

    If you want to create a new branch to retain commits you create, you may
    do so (now or later) by using -b with the checkout command again. Example:

    git checkout -b <new-branch-name>

    HEAD is now at f6effc9 Merge branch 'lisa'

#>

# which branch are we in?
git branch --list
<#

* (HEAD detached at f6effc9)
  lisa
  master

#>

# do some experimenting with the recipe
Get-Content .\recipes\apple_pie.txt
<#

    Apple Pie

    pre-made pastry
    1/2 cup butter
    3 tablespoons flour
    1 cup  sugar
    1 tbsp cinnamon
    9 Granny Smith apples

#>
(Get-Content .\recipes\apple_pie.txt) -replace "9 Granny Smith apples", "20 Granny Smith apples" | Set-Content .\recipes\apple_pie.txt
Get-Content .\recipes\apple_pie.txt
<#

    Apple Pie

    pre-made pastry
    1/2 cup butter
    3 tablespoons flour
    1 cup  sugar
    1 tbsp cinnamon
    20 Granny Smith apples

#>
git status
<#

    HEAD detached at f6effc9
    Changes not staged for commit:
    (use "git add <file>..." to update what will be committed)
    (use "git checkout -- <file>..." to discard changes in working directory)

            modified:   recipes/apple_pie.txt

    no changes added to commit (use "git add" and/or "git commit -a")

#>
git add .\recipes\
git commit --message "Add more apples"
<#

    [detached HEAD eee6518] Add more apples
    1 file changed, 1 insertion(+), 1 deletion(-)

#>
(Get-Content .\recipes\apple_pie.txt) -replace "9 Granny Smith apples", "20 Granny Smith apples" | Set-Content .\recipes\apple_pie.txt
Get-Content .\recipes\apple_pie.txt
<#

    Apple Pie

    pre-made pastry
    1/2 cup butter
    3 tablespoons flour
    1 cup  sugar
    1 tbsp cinnamon
    20 Granny Smith apples

#>
(Get-Content .\recipes\apple_pie.txt) -notmatch "1 cup  sugar"  | Set-Content .\recipes\apple_pie.txt
Get-Content .\recipes\apple_pie.txt
<#

    Apple Pie

    pre-made pastry
    1/2 cup butter
    3 tablespoons flour
    1 tbsp cinnamon
    20 Granny Smith apples

#>
git add .\recipes
git commit --message "Remove sugar"
git log --oneline
<#

    6b7e514 (HEAD) Remove sugar
    eee6518 Add more apples
    f6effc9 (master, lisa) Merge branch 'lisa'
    196735c Add Lisa's version of the pie
    19a9e91 Added recipe
    3928bee (tag: mytag) Add cake
    e79f317 First commit!

#>

# experimental recipe tasted like cooked apples so abandon and go back to master
git checkout master
<#

    Warning: you are leaving 2 commits behind, not connected to
    any of your branches:

    6b7e514 Remove sugar
    eee6518 Add more apples

    If you want to keep them by creating a new branch, this may be a good time
    to do so with:

    git branch <new-branch-name> 6b7e514

    Switched to branch 'master'

#>

# previous 2 commits are unreachable unless commit hashes are known
# eventually these will be garbage-collected

# can go back to this by switching to it and creating a branch
git checkout 6b7e514
<#

    Note: checking out '6b7e514'.

    You are in 'detached HEAD' state. You can look around, make experimental
    changes and commit them, and you can discard any commits you make in this
    state without impacting any branches by performing another checkout.

    If you want to create a new branch to retain commits you create, you may
    do so (now or later) by using -b with the checkout command again. Example:

    git checkout -b <new-branch-name>

    HEAD is now at 6b7e514 Remove sugar

#>
# create a branch of this experimental recipe
git branch nogood

# return to master
git checkout master
