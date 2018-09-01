# see current branches
git branch --list

# branches are stored in .\git\refs\heads\ (currently contents 1 file: master)
Get-ChildItem .\.git\refs\heads

# get content of master (3928beef6aa73e0734b965faa2ed82efc0c51455 - this is hash of latest commit)
Get-Content .\.git\refs\heads\master

# A BRANCH IS JUST A REFERENCE TO A COMMIT

# Create new branch
git branch lisa

# see branches (master and lisa)
git branch --list
<#

  lisa
* master

#>

# branch has been created inside refs\heads\...
Get-ChildItem .\.git\refs\heads
<#

        Directory: F:\dev\cookbook\.git\refs\heads


    Mode                LastWriteTime         Length Name
    ----                -------------         ------ ----
    -a----       01/09/2018     11:00             41 lisa
    -a----       01/09/2018     10:32             41 master

#>

# lisa is just another pointer to same commit as master
Get-Content .\.git\refs\heads\lisa
# 3928beef6aa73e0734b965faa2ed82efc0c51455

Get-Content .\.git\refs\heads\master
# 3928beef6aa73e0734b965faa2ed82efc0c51455

# .\.git\HEAD tracks the current branch
Get-Content .\.git\HEAD
# ref: refs/heads/master

# add details to Apple Pie recipe
$applePieRecipe = @"

pre-made pastry
1/2 cup butter
3 tablespoons flour
1 cup  sugar
8 Granny Smith apples
"@

Add-Content -Path .\recipes\apple_pie.txt -Value $applePieRecipe

# check recipe and status, stage, re-check and commit
Get-Content .\recipes\apple_pie.txt
git status
git add .\recipes\apple_pie.txt
git status
git commit --message "Added recipe"
git log --oneline
<#

    19a9e91 (HEAD -> master) Added recipe
    3928bee (tag: mytag, lisa) Add cake
    e79f317 First commit!

#>
# now HEAD -> master -> latest commit (19a9e91) and lisa -> mytag -> 3928bee

# list branches, change to lisa, list again
git branch --list
<#

    lisa
    * master

#>
git checkout lisa
git branch --list
<#

    * lisa
    master

#>

Get-Content .\.git\HEAD
# ref: refs/heads/lisa

# now that we're in lisa branch, this is before most recent commit so Apple Pie recipe's ingredients are missing
Get-Content .\recipes\apple_pie.txt
# Apple Pie

# add lisa's version of apple pie (add cinnamon; more apples)
$applePieRecipe = @"

pre-made pastry
1/2 cup butter
3 tablespoons flour
1 cup  sugar
1 tbsp cinnamon
10 Granny Smith apples
"@

# save, check content and status, add, commit, check log
Add-Content .\recipes\apple_pie.txt -Value $applePieRecipe
Get-Content .\recipes\apple_pie.txt
git status
git add .\recipes\apple_pie.txt
git commit --message "Add Lisa's version of the pie"
git log --oneline
<#

    196735c (HEAD -> lisa) Add Lisa's version of the pie
    3928bee (tag: mytag) Add cake
    e79f317 First commit!

#>

