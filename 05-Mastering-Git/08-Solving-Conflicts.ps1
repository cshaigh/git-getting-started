Get-Content .\recipes\guacamole.txt
<#

    Guacamole

    Avacados
    Lime juice
    Serreno chillies
    Coriander
    Salt
    Black pepper

#>

# make a new tomato branch and add tomato to guacamole recipe
git branch tomato
git checkout tomato
Add-Content .\recipes\guacamole.txt "Tomato"
git add .\recipes\guacamole.txt
git commit --message "Add tomato to guacamole"
git log --oneline
<#

    d19f975 (HEAD -> tomato) Add tomato to guacamole
    cc9be1b (master) Add guacamole
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

# modify guacamole in master branch too
git checkout master
Add-Content .\recipes\guacamole.txt "Onion"
git add .\recipes\guacamole.txt
git commit --message "Add onion to guacamole"
git log --oneline
<#

    7a12c1a (HEAD -> master) Add onion to guacamole
    cc9be1b Add guacamole
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

# try to merge tomato branch into current branch
git merge tomato
<#

    Auto-merging recipes/guacamole.txt
    CONFLICT (content): Merge conflict in recipes/guacamole.txt
    Automatic merge failed; fix conflicts and then commit the result.

#>

git status
<#

    On branch master
    You have unmerged paths.
    (fix conflicts and run "git commit")
    (use "git merge --abort" to abort the merge)

    Unmerged paths:
    (use "git add <file>..." to mark resolution)

            both modified:   recipes/guacamole.txt

    no changes added to commit (use "git add" and/or "git commit -a")

#>

# review conflict
Get-Content .\recipes\guacamole.txt
<#

    Guacamole

    Avacados
    Lime juice
    Serreno chillies
    Coriander
    Salt
    Black pepper
    <<<<<<< HEAD
    Onion
    =======
    Tomato
    >>>>>>> tomato

#>

# git knows there is a merge in progress because it has created some files to record this: -
Get-ChildItem .\.git
<#

        Directory: F:\dev\cookbook\.git


    Mode                LastWriteTime         Length Name
    ----                -------------         ------ ----
    d-----       01/09/2018     10:07                hooks
    d-----       01/09/2018     10:07                info
    d-----       01/09/2018     10:11                logs
    d-----       15/09/2018     15:42                objects
    d-----       15/09/2018     15:31                refs
    -a----       15/09/2018     15:41             23 COMMIT_EDITMSG
    -a----       01/09/2018     16:55            130 config
    -a----       01/09/2018     10:07             73 description
    -a----       15/09/2018     15:40             23 HEAD
    -a----       15/09/2018     15:42            662 index
    -a----       15/09/2018     15:42             41 MERGE_HEAD
    -a----       15/09/2018     15:42              0 MERGE_MODE
    -a----       15/09/2018     15:42             60 MERGE_MSG
    -a----       15/09/2018     15:42             41 ORIG_HEAD

#>

Get-Content .\.git\MERGE_HEAD
<#

    d19f975c76ed30c0ea9382c10b8cced5af27cf34

#>

# this is a temporary pointer to the tip of the branch being merged in
git show d19f975c76ed30c0ea9382c10b8cced5af27cf34
<#

    commit d19f975c76ed30c0ea9382c10b8cced5af27cf34 (tomato)
    Author: Chris Haigh <cshaigh1981@gmail.com>
    Date:   Sat Sep 15 15:39:05 2018 +0100

        Add tomato to guacamole

    diff --git a/recipes/guacamole.txt b/recipes/guacamole.txt
    index 2839722..148fe3a 100644
    --- a/recipes/guacamole.txt
    +++ b/recipes/guacamole.txt
    @@ -6,3 +6,4 @@ Serreno chillies
    Coriander
    Salt
    Black pepper
    +Tomato

#>

# manually resolve conflicts

$guacamoleRecipe = @"
Guacamole

Avacados
Lime juice
Serreno chillies
Coriander
Salt
Black pepper
Tomato
Onion
"@

Set-Content .\recipes\guacamole.txt $guacamoleRecipe
Get-Content .\recipes\guacamole.txt
<#

    Guacamole

    Avacados
    Lime juice
    Serreno chillies
    Coriander
    Salt
    Black pepper
    Tomato
    Onion

#>

# git status still shows as unresolved
git status
<#

    On branch master
    You have unmerged paths.
    (fix conflicts and run "git commit")
    (use "git merge --abort" to abort the merge)

    Unmerged paths:
    (use "git add <file>..." to mark resolution)

            both modified:   recipes/guacamole.txt

    no changes added to commit (use "git add" and/or "git commit -a")

#>

# add changes to index to tell git the conflict is solved
git add .\recipes\guacamole.txt

# conflict now showing as resolve and staged in index
git status
<#

    On branch master
    All conflicts fixed but you are still merging.
    (use "git commit" to conclude merge)

    Changes to be committed:

            modified:   recipes/guacamole.txt

#>

# complete the merge
git commit

# verify merge completed and file correct
git log --oneline
<#

    becf2cc (HEAD -> master) Merge branch 'tomato'
    7a12c1a Add onion to guacamole
    d19f975 (tomato) Add tomato to guacamole
    cc9be1b Add guacamole
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

Get-Content .\recipes\guacamole.txt
<#

    Guacamole

    Avacados
    Lime juice
    Serreno chillies
    Coriander
    Salt
    Black pepper
    Tomato
    Onion

#>
