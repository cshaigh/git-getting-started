<#

The Golden Rule: never change shared history

#>

git checkout master
git branch
<#

    lisa
    * master
    nogood
    spaghetti
    tomato

#>

Add-Content .\menu.txt "Caesar Salad"
Get-Content .\menu.txt
<#

    Spaghetti alla Carbonara
    Apple Pie
    Cheesecake
    Chicken Tikka Masala
    Guacamole
    Caesar Salad

#>
git add .\menu.txt
git status
<#

    On branch master
    Changes to be committed:
    (use "git reset HEAD <file>..." to unstage)

            modified:   menu.txt

#>
git commit --message "Added Caesar Salad to menu"
git log --oneline
<#

    ff55654 (HEAD -> master) Added Caesar Salad to menu
    07b7cf8 Make README all uppercase
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

# oops!  forgot to add recipe file

$caesarSaladRecipe = @"
Caesar Salad

Romaine Lettuce
Anchovies
Eggs
Parmesan Cheese
Olive Oil
"@

Add-Content .\recipes\caesar_salad.txt $caesarSaladRecipe

# stage this change
git add .\recipes\caesar_salad.txt

# AMEND previous commit to also include this change
git commit --amend

# prompted commit message includes both changes and previous commit message for editing if desired
<#

    Add Caesar Salad to menu

    # Please enter the commit message for your changes. Lines starting
    # with '#' will be ignored, and an empty message aborts the commit.
    #
    # Date:      Sun Sep 16 15:52:37 2018 +0100
    #
    # On branch master
    # Changes to be committed:
    #	modified:   menu.txt
    #	new file:   recipes/caesar_salad.txt
    #

#>

# behind the scenes, git copies previous commit into new object with amended changes; previous object/commit is eventually garbage collected.

git log --oneline
<#

    f18bc67 (HEAD -> master) Add Caesar Salar to menu
    07b7cf8 Make README all uppercase
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

# differences show with git show
git show HEAD
<#

    commit f18bc6745c04261f394caf532730a52a204c8a32 (HEAD -> master)
    Author: Chris Haigh <cshaigh1981@gmail.com>
    Date:   Sun Sep 16 15:52:37 2018 +0100

        Add Caesar Salar to menu

    diff --git a/menu.txt b/menu.txt
    index 51cd4ef..43970f6 100644
    --- a/menu.txt
    +++ b/menu.txt
    @@ -3,3 +3,4 @@ Apple Pie
    Cheesecake
    Chicken Tikka Masala
    Guacamole
    +Caesar Salad
    diff --git a/recipes/caesar_salad.txt b/recipes/caesar_salad.txt
    new file mode 100644
    index 0000000..66ea3c1
    --- /dev/null
    +++ b/recipes/caesar_salad.txt
    @@ -0,0 +1,7 @@
    +Caesar Salad
    +
    +Romaine Lettuce
    +Anchovies
    +Eggs
    +Parmesan Cheese
    +Olive Oil

#>