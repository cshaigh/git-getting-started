git branch
<#

    lisa
    * master
    nogood
    spaghetti
    tomato

#>

git checkout nogood

# see graphed and decorated (colour-coded) log with one entry per line
git log --graph --decorate --oneline
<#

* 6b7e514 (HEAD -> nogood) Remove sugar
* eee6518 Add more apples
*   f6effc9 (lisa) Merge branch 'lisa'
|\
| * 196735c Add Lisa's version of the pie
* | 19a9e91 Added recipe
|/
* 3928bee (tag: mytag) Add cake
* e79f317 First commit!

#>

# show specific details about a commit (Remove sugar)
git show 6b7e514
<#

    commit 6b7e514f505295cce6a4ad81386bb2dbc71c5925 (HEAD -> nogood)
    Author: Chris Haigh <cshaigh1981@gmail.com>
    Date:   Sat Sep 1 16:12:59 2018 +0100

        Remove sugar

    diff --git a/recipes/apple_pie.txt b/recipes/apple_pie.txt
    index 6ebae1e..e7f536a 100644
    --- a/recipes/apple_pie.txt
    +++ b/recipes/apple_pie.txt
    @@ -3,6 +3,5 @@ Apple Pie
    pre-made pastry
    1/2 cup butter
    3 tablespoons flour
    -1 cup  sugar
    1 tbsp cinnamon
    20 Granny Smith apples

#>

# can also show current branch commit by using its name
git show nogood
<#

    commit 6b7e514f505295cce6a4ad81386bb2dbc71c5925 (HEAD -> nogood)
    Author: Chris Haigh <cshaigh1981@gmail.com>
    Date:   Sat Sep 1 16:12:59 2018 +0100

        Remove sugar

    diff --git a/recipes/apple_pie.txt b/recipes/apple_pie.txt
    index 6ebae1e..e7f536a 100644
    --- a/recipes/apple_pie.txt
    +++ b/recipes/apple_pie.txt
    @@ -3,6 +3,5 @@ Apple Pie
    pre-made pastry
    1/2 cup butter
    3 tablespoons flour
    -1 cup  sugar
    1 tbsp cinnamon
    20 Granny Smith apples

#>

# can also use HEAD
git show HEAD
<#

    commit 6b7e514f505295cce6a4ad81386bb2dbc71c5925 (HEAD -> nogood)
    Author: Chris Haigh <cshaigh1981@gmail.com>
    Date:   Sat Sep 1 16:12:59 2018 +0100

        Remove sugar

    diff --git a/recipes/apple_pie.txt b/recipes/apple_pie.txt
    index 6ebae1e..e7f536a 100644
    --- a/recipes/apple_pie.txt
    +++ b/recipes/apple_pie.txt
    @@ -3,6 +3,5 @@ Apple Pie
    pre-made pastry
    1/2 cup butter
    3 tablespoons flour
    -1 cup  sugar
    1 tbsp cinnamon
    20 Granny Smith apples

#>

# can combine a name or hash with the carat ^ - each ^ means "parent of"
git show HEAD^
<#

    commit eee65188876e5b486721a6164f6beb43e8f28a55
    Author: Chris Haigh <cshaigh1981@gmail.com>
    Date:   Sat Sep 1 15:26:13 2018 +0100

        Add more apples

    diff --git a/recipes/apple_pie.txt b/recipes/apple_pie.txt
    index 6acdf5d..6ebae1e 100644
    --- a/recipes/apple_pie.txt
    +++ b/recipes/apple_pie.txt
    @@ -5,4 +5,4 @@ pre-made pastry
    3 tablespoons flour
    1 cup  sugar
    1 tbsp cinnamon
    -9 Granny Smith apples
    +20 Granny Smith apples

#>

# can stack carats to denote parents of parents of
git show HEAD^^
<#

    commit f6effc9fedc68e8f579c9e171c5415cf5eede03e (lisa)
    Merge: 19a9e91 196735c
    Author: Chris Haigh <cshaigh1981@gmail.com>
    Date:   Sat Sep 1 14:56:19 2018 +0100

        Merge branch 'lisa'

    diff --cc recipes/apple_pie.txt
    index 7b760a1,d18ae4d..6acdf5d
    --- a/recipes/apple_pie.txt
    +++ b/recipes/apple_pie.txt
    @@@ -4,4 -4,5 +4,5 @@@ pre-made pastr
    1/2 cup butter
    3 tablespoons flour
    1 cup  sugar
    - 8 Granny Smith apples
    + 1 tbsp cinnamon
    -10 Granny Smith apples
    ++9 Granny Smith apples

#>

# can go back x number of parent commits by using the tilda (~)
git show HEAD~2
<#

    commit f6effc9fedc68e8f579c9e171c5415cf5eede03e (lisa)
    Merge: 19a9e91 196735c
    Author: Chris Haigh <cshaigh1981@gmail.com>
    Date:   Sat Sep 1 14:56:19 2018 +0100

        Merge branch 'lisa'

    diff --cc recipes/apple_pie.txt
    index 7b760a1,d18ae4d..6acdf5d
    --- a/recipes/apple_pie.txt
    +++ b/recipes/apple_pie.txt
    @@@ -4,4 -4,5 +4,5 @@@ pre-made pastr
    1/2 cup butter
    3 tablespoons flour
    1 cup  sugar
    - 8 Granny Smith apples
    + 1 tbsp cinnamon
    -10 Granny Smith apples
    ++9 Granny Smith apples

#>

# when there are multiple parents (i.e. after a merge), can select a specific parent to show by suffixing number to carat

# e.g. show HEAD's second single parent's second multiple parent (lisa's version of the pie)
git show HEAD~2^2
<#

    commit 196735c0bfdc6c3887e8cbf110541ed237f53198
    Author: Chris Haigh <cshaigh1981@gmail.com>
    Date:   Sat Sep 1 11:24:07 2018 +0100

        Add Lisa's version of the pie

    diff --git a/recipes/apple_pie.txt b/recipes/apple_pie.txt
    index 2399189..d18ae4d 100644
    --- a/recipes/apple_pie.txt
    +++ b/recipes/apple_pie.txt
    @@ -1 +1,8 @@
    Apple Pie
    +
    +pre-made pastry
    +1/2 cup butter
    +3 tablespoons flour
    +1 cup  sugar
    +1 tbsp cinnamon
    +10 Granny Smith apples

#>

# show 1 month ago - also note wrapping in single-quotes to avoid creating a PS array!
git show 'HEAD@{"1 month ago"}'
<#

    warning: Log for 'HEAD' only goes back to Sat, 1 Sep 2018 10:11:00 +0100.
    commit e79f3176a353eddc137eae4ca3431e03918baf42
    Author: Chris Haigh <cshaigh1981@gmail.com>
    Date:   Sat Sep 1 10:11:00 2018 +0100

        First commit!

    diff --git a/menu.txt b/menu.txt
    new file mode 100644
    index 0000000..2399189
    --- /dev/null
    +++ b/menu.txt
    @@ -0,0 +1 @@
    +Apple Pie
    diff --git a/recipes/README.txt b/recipes/README.txt
    new file mode 100644
    index 0000000..361af85
    --- /dev/null
    +++ b/recipes/README.txt
    @@ -0,0 +1 @@
    +Put your recipes in this directory, one recipe per file.
    diff --git a/recipes/apple_pie.txt b/recipes/apple_pie.txt
    new file mode 100644
    index 0000000..2399189
    --- /dev/null
    +++ b/recipes/apple_pie.txt

#>

# see who changed the apple pie recipe file and when
# carat ^ denotes first commit of this file to repo
git blame .\recipes\apple_pie.txt
<#

    ^e79f317 (Chris Haigh 2018-09-01 10:11:00 +0100 1) Apple Pie
    19a9e917 (Chris Haigh 2018-09-01 11:13:49 +0100 2)
    19a9e917 (Chris Haigh 2018-09-01 11:13:49 +0100 3) pre-made pastry
    19a9e917 (Chris Haigh 2018-09-01 11:13:49 +0100 4) 1/2 cup butter
    19a9e917 (Chris Haigh 2018-09-01 11:13:49 +0100 5) 3 tablespoons flour
    196735c0 (Chris Haigh 2018-09-01 11:24:07 +0100 6) 1 tbsp cinnamon
    eee65188 (Chris Haigh 2018-09-01 15:26:13 +0100 7) 20 Granny Smith apples

#>

# compare differences between current commit and 2 commits earlier
git diff HEAD HEAD~2
<#

    diff --git a/recipes/apple_pie.txt b/recipes/apple_pie.txt
    index e7f536a..6acdf5d 100644
    --- a/recipes/apple_pie.txt
    +++ b/recipes/apple_pie.txt
    @@ -3,5 +3,6 @@ Apple Pie
    pre-made pastry
    1/2 cup butter
    3 tablespoons flour
    +1 cup  sugar
    1 tbsp cinnamon
    -20 Granny Smith apples
    +9 Granny Smith apples

#>

# compare differences between branches
git diff nogood master
<#

    diff --git a/menu.txt b/menu.txt
    index f1fe985..51cd4ef 100644
    --- a/menu.txt
    +++ b/menu.txt
    @@ -1,2 +1,5 @@
    +Spaghetti alla Carbonara
    Apple Pie
    Cheesecake
    +Chicken Tikka Masala
    +Guacamole
    diff --git a/recipes/README.txt b/recipes/README.txt
    index 361af85..8b98b6d 100644
    Binary files a/recipes/README.txt and b/recipes/README.txt differ
    diff --git a/recipes/apple_pie.txt b/recipes/apple_pie.txt
    index e7f536a..6acdf5d 100644
    --- a/recipes/apple_pie.txt
    +++ b/recipes/apple_pie.txt
    @@ -3,5 +3,6 @@ Apple Pie
    pre-made pastry
    1/2 cup butter
    3 tablespoons flour
    +1 cup  sugar
    1 tbsp cinnamon
    -20 Granny Smith apples
    +9 Granny Smith apples

#>

# get detailed log in patch format
git log --patch

# filter log messages to those containing apples
git log --grep apples --oneline
<#

    eee6518 Add more apples

#>

# search log for "apples" regex in commits, display in patch format
git log -G"apples" --patch
<#

    commit eee65188876e5b486721a6164f6beb43e8f28a55
    Author: Chris Haigh <cshaigh1981@gmail.com>
    Date:   Sat Sep 1 15:26:13 2018 +0100

    Add more apples

    diff --git a/recipes/apple_pie.txt b/recipes/apple_pie.txt
    index 6acdf5d..6ebae1e 100644
    --- a/recipes/apple_pie.txt
    +++ b/recipes/apple_pie.txt
    @@ -5,4 +5,4 @@ pre-made pastry
    3 tablespoons flour
    1 cup  sugar
    1 tbsp cinnamon
    -9 Granny Smith apples
    +20 Granny Smith apples

    commit 196735c0bfdc6c3887e8cbf110541ed237f53198
    Author: Chris Haigh <cshaigh1981@gmail.com>
    Date:   Sat Sep 1 11:24:07 2018 +0100

        Add Lisa's version of the pie

    diff --git a/recipes/apple_pie.txt b/recipes/apple_pie.txt
    index 2399189..d18ae4d 100644
    --- a/recipes/apple_pie.txt
    +++ b/recipes/apple_pie.txt
    @@ -1 +1,8 @@
    Apple Pie
    +
    +pre-made pastry
    +1/2 cup butter
    +3 tablespoons flour
    +1 cup  sugar
    +1 tbsp cinnamon
    +10 Granny Smith apples

    commit 19a9e91717a188102e386a9aff2c80fa929e2050
    Author: Chris Haigh <cshaigh1981@gmail.com>
    Date:   Sat Sep 1 11:13:49 2018 +0100

        Added recipe

    diff --git a/recipes/apple_pie.txt b/recipes/apple_pie.txt
    index 2399189..7b760a1 100644
    --- a/recipes/apple_pie.txt
    +++ b/recipes/apple_pie.txt
    @@ -1 +1,7 @@
    Apple Pie
    +
    +pre-made pastry
    +1/2 cup butter
    +3 tablespoons flour
    +1 cup  sugar
    +8 Granny Smith apples

#>

# the same log as a summary
git log -G"apples" --oneline
<#

    eee6518 Add more apples
    196735c Add Lisa's version of the pie
    19a9e91 Added recipe

#>

# show the last 3 commits in the log
git log -3 --oneline
<#

    6b7e514 (HEAD -> nogood) Remove sugar
    eee6518 Add more apples
    f6effc9 (lisa) Merge branch 'lisa'

#>

# show log between range: HEAD-5 to parent of HEAD on oneline
# git log HEAD tilda 5 dot dot HEAD carat
git log HEAD~5..HEAD^ --oneline
<#

    eee6518 Add more apples
    f6effc9 (lisa) Merge branch 'lisa'
    196735c Add Lisa's version of the pie
    19a9e91 Added recipe
    3928bee (tag: mytag) Add cake

#>

# show all commits in master branch that are not in nogood branch
git log nogood..master --oneline
<#

    07b7cf8 (master) Make README all uppercase
    becf2cc Merge branch 'tomato'
    7a12c1a Add onion to guacamole
    d19f975 (tomato) Add tomato to guacamole
    cc9be1b Add guacamole
    48aba0c Well, I changed my mind about that renaming
    e733ef5 Use Markdown for the menu
    d547b52 Add Tikka Masala to menu
    022ba96 (tag: dinner, spaghetti) Add carbonara ingredients
    f6ac104 Add spaghetti alla carbonara

#>
