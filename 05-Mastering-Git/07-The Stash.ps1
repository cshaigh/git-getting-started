# The stash is all yours and only changes when you invoke stash-specific commands

## STASH EXAMPLE

# create new item, stage change in index
New-Item -ItemType File -Path .\recipes\guacamole.txt
git add .\recipes\guacamole.txt
git status

# add to menu.txt
Add-Content .\menu.txt "Guacamole"

# we now have a change in the working area and a new file in both working area and index: -
git status
<#

    On branch master
    Changes to be committed:
    (use "git reset HEAD <file>..." to unstage)

            new file:   recipes/guacamole.txt

    Changes not staged for commit:
    (use "git add <file>..." to update what will be committed)
    (use "git checkout -- <file>..." to discard changes in working directory)

            modified:   menu.txt

#>

# something comes up where we need to shelve our work and go back to a clean checkout, so we stash
git stash --include-untracked
<#

    Saved working directory and index state WIP on master: 48aba0c Well, I changed my mind about that renaming

#>

# we are now back to clean status
git status
<#

    On branch master
    nothing to commit, working tree clean

#>

# no sign of our guacamole recipe...
Get-ChildItem .\recipes
<#

        Directory: F:\dev\cookbook\recipes


    Mode                LastWriteTime         Length Name
    ----                -------------         ------ ----
    -a----       01/09/2018     16:20            121 apple_pie.txt
    -a----       01/09/2018     09:54             58 README.txt
    -a----       15/09/2018     13:25            150 spaghetti_alla_carbonara.txt

#>

# see what's in the stash
git stash list
<#

    stash@{0}: WIP on master: 48aba0c Well, I changed my mind about that renaming

#>

# re-apply most recent stash element
git stash apply
<#

    On branch master
    Changes to be committed:
    (use "git reset HEAD <file>..." to unstage)

            new file:   recipes/guacamole.txt

    Changes not staged for commit:
    (use "git add <file>..." to update what will be committed)
    (use "git checkout -- <file>..." to discard changes in working directory)

            modified:   menu.txt

#>

# Finish the recipe

$guacamoleRecipe = @"
Guacamole

Avacados
Lime juice
Serreno chillies
Coriander
Salt
Black pepper
"@

Add-Content .\recipes\guacamole.txt $guacamoleRecipe
Get-Content .\recipes\guacamole.txt

# stage and commit everything, including previously stashed stuff
git add .\menu.txt
git add .\recipes\guacamole.txt
git status
<#

    On branch master
    Changes to be committed:
    (use "git reset HEAD <file>..." to unstage)

            modified:   menu.txt
            new file:   recipes/guacamole.txt

#>
git commit --message "Add guacamole"

# list and clear stash, then verify it's been cleared
git stash list
<#

    stash@{0}: WIP on master: 48aba0c Well, I changed my mind about that renaming

#>
git stash clear
git stash list