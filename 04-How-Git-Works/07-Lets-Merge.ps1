# switch back to master
git checkout master

git branch --list
<#

    lisa
    * master

#>

# old version of apple pie recipe
Get-Content .\recipes\apple_pie.txt
<#

    Apple Pie

    pre-made pastry
    1/2 cup butter
    3 tablespoons flour
    1 cup  sugar
    8 Granny Smith apples

#>

git merge lisa
<#
    Auto-merging recipes/apple_pie.txt
    CONFLICT (content): Merge conflict in recipes/apple_pie.txt
    Automatic merge failed; fix conflicts and then commit the result.
#>

# manually resolve conflicts using an editor
nano .\recipes\apple_pie.txt

# get status, stage, re-check status and commit merge
git status
git add .\recipes\apple_pie.txt
git status

# approve auto-generated commit message
git commit 

# check commit log
git log --oneline
<#

    f6effc9 (HEAD -> master) Merge branch 'lisa'
    196735c (lisa) Add Lisa's version of the pie
    19a9e91 Added recipe
    3928bee (tag: mytag) Add cake
    e79f317 First commit!

#>

# peek merge commit
git cat-file -p f6effc9
<#

    tree 62334085c2a61a2f9c1950e9e73e226afbd07cd5
    parent 19a9e91717a188102e386a9aff2c80fa929e2050
    parent 196735c0bfdc6c3887e8cbf110541ed237f53198
    author Chris Haigh <cshaigh1981@gmail.com> 1535810179 +0100
    committer Chris Haigh <cshaigh1981@gmail.com> 1535810179 +0100

#>
# note the above has 2 parents (i.e. 2 branches), indicating a merge