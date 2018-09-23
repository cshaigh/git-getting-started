git branch
<#

  lisa
  master
  nogood
* recovered
  spaghetti
  tomato

#>

git checkout lisa

git log --graph --decorate --oneline
<#

    *   f6effc9 (HEAD -> lisa) Merge branch 'lisa'
    |\
    | * 196735c Add Lisa's version of the pie
    * | 19a9e91 Added recipe
    |/
    * 3928bee (tag: mytag) Add cake
    * e79f317 First commit!

#>

# commit 3928bee is wrong cos it added Cheesecake to cookbook but didn't add recipe
git show 3928bee
<#

    commit 3928beef6aa73e0734b965faa2ed82efc0c51455 (tag: mytag)
    Author: Chris Haigh <cshaigh1981@gmail.com>
    Date:   Sat Sep 1 10:32:40 2018 +0100

        Add cake

    diff --git a/menu.txt b/menu.txt
    index 2399189..f1fe985 100644
    --- a/menu.txt
    +++ b/menu.txt
    @@ -1 +1,2 @@
    Apple Pie
    +Cheesecake

#>

# decide to remove the cheesecake commit
# could use interactive rebase - this would rewrite all subsequent commit history
# could edit the menu so that the line isn't added - this would leave behind messy commits
# could use git revert to undo the changes and record this in the history
git revert 3928bee
<#

    [lisa 38500f2] Revert "Add cake"
    1 file changed, 1 deletion(-)

#>

# this creates a new commit explaining exactly what has happened
git log --graph --oneline --decorate
<#

    * 38500f2 (HEAD -> lisa) Revert "Add cake"
    *   f6effc9 Merge branch 'lisa'
    |\
    | * 196735c Add Lisa's version of the pie
    * | 19a9e91 Added recipe
    |/
    * 3928bee (tag: mytag) Add cake
    * e79f317 First commit!

#>
