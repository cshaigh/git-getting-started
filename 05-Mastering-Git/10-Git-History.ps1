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