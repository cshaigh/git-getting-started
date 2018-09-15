Set-Content .\COPYRIGHT "Copyright 2018, Chris Haigh"

Get-ChildItem
<#

        Directory: F:\dev\cookbook


    Mode                LastWriteTime         Length Name
    ----                -------------         ------ ----
    d-----       15/09/2018     13:25                recipes
    -a----       15/09/2018     13:26             29 COPYRIGHT
    -a----       15/09/2018     13:25             71 menu.txt

#>

# COPYRIGHT is marked as Untracked in git status (in working area but not index or repository)
git status
<#

    On branch master
    Untracked files:
    (use "git add <file>..." to include in what will be committed)

            COPYRIGHT

    nothing added to commit but untracked files present (use "git add" to track)

#>

# add COPYRIGHT to index and verify that it's in working area + index, but not repository
git add .\COPYRIGHT

git status
<#

    On branch master
    Changes to be committed:
    (use "git reset HEAD <file>..." to unstage)

            new file:   COPYRIGHT

#>

# change our mind; take COPYRIGHT out of index
git rm --cached .\COPYRIGHT
# rm 'COPYRIGHT'

# verify that COPYRIGHT is still in working area: -
Get-ChildItem
<#

        Directory: F:\dev\cookbook


    Mode                LastWriteTime         Length Name
    ----                -------------         ------ ----
    d-----       15/09/2018     13:25                recipes
    -a----       15/09/2018     13:26             29 COPYRIGHT
    -a----       15/09/2018     13:25             71 menu.txt

#>

git status
<#

    On branch master
    Untracked files:
    (use "git add <file>..." to include in what will be committed)

            COPYRIGHT

    nothing added to commit but untracked files present (use "git add" to track)

#>

# NB: git rm without args is not the opposite of git add

# delete COPYRIGHT for good and verify all is clean
Remove-Item .\COPYRIGHT

git status
<#

    On branch master
    nothing to commit, working tree clean

#>