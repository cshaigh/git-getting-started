# Clone remote version of cookbook
git clone https://github.com/nusco/cookbook.git cookbook2
<#

    Cloning into 'cookbook2'...
    remote: Counting objects: 47, done.
    remote: Total 47 (delta 0), reused 0 (delta 0), pack-reused 47
    Unpacking objects: 100% (47/47), done.

#>
Set-Location .\cookbook2
git log --oneline
<#

    704182f (HEAD -> master, origin/master, origin/HEAD) Add lemon juice to the apple pie
    5d4a817 (origin/spaghetti) Add carbonara ingredients
    ca760f8 Add spaghetti alla carbonara
    bf36d97 Tweak apple pie some more
    fced3af Tweak apple pie
    ecbebe6 (origin/lisa) Merge branch 'lisa'
    007ffe9 Add Lisa's version of the pie
    e268621 Add recipe
    5720fdf Add cake
    11779f4 First commit!

#>

# show local branches
git branch --list
# * master

# show remote branches
git branch --list --remotes
<#

    origin/HEAD -> origin/master
    origin/lisa
    origin/master
    origin/nogood
    origin/spaghetti

#>

# show all branches
git branch --list --all
<#

    * master
    remotes/origin/HEAD -> origin/master
    remotes/origin/lisa
    remotes/origin/master
    remotes/origin/nogood
    remotes/origin/spaghetti

#>

# active remote branches are tracked in .\.git\refs\remotes\...
# inactive remote branches are tracked in .\.git\packed-refs

git show-ref master
<#

    704182f5e2925fbdc03f9874d35ce696c21e9a3d refs/heads/master
    704182f5e2925fbdc03f9874d35ce696c21e9a3d refs/remotes/origin/master

#>

git show-ref lisa
# ecbebe6601f5730ed6157f95175204cdf4d0542a refs/remotes/origin/lisa