# make some files upper case then stage into the index
(Get-Content .\menu.txt -Raw).ToUpper() | Out-File .\menu.txt
(Get-Content .\recipes\README.txt -Raw).ToUpper() | Out-File .\recipes\README.txt

git add .
git status
<#

    On branch master
    Changes to be committed:
    (use "git reset HEAD <file>..." to unstage)

            modified:   menu.txt
            modified:   recipes/README.txt

#>

# like the change to readme, but not the menu file
# would like to unstage the menu but not the readme
# so, use git reset HEAD (--mixed by default: copies repository HEAD commit for specific file to index, effectively unstaging it)
git reset HEAD .\menu.txt

# readme change is still stage but menu isn't
git status
<#

    On branch master
    Changes to be committed:
    (use "git reset HEAD <file>..." to unstage)

            modified:   recipes/README.txt

    Changes not staged for commit:
    (use "git add <file>..." to update what will be committed)
    (use "git checkout -- <file>..." to discard changes in working directory)

            modified:   menu.txt

#>

# decide to completely undo changes to menu.txt...
git reset --hard HEAD .\menu.txt
<#

    fatal: Cannot do hard reset with paths.

#>

# weird solution: use checkout HEAD <file>
git checkout HEAD .\menu.txt

# menu.txt has been restored, just as we wanted
Get-Content .\menu.txt
<#

    Spaghetti alla Carbonara
    Apple Pie
    Cheesecake
    Chicken Tikka Masala
    Guacamole

#>

# commit desired change
git commit --message "Make README all uppercase"

git log --oneline
<#

    07b7cf8 (HEAD -> master) Make README all uppercase
    becf2cc Merge branch 'tomato'
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