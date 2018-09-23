# fix mistakes in the ancient past.
# e.g. cheesecake and chicken tikka masala also weren't committed with a corresponding recipe file...

# find out when these were added to the menu
git blame .\menu.txt
<#

    f6ac104b (Chris Haigh 2018-09-01 16:56:44 +0100 1) Spaghetti alla Carbonara
    ^e79f317 (Chris Haigh 2018-09-01 10:11:00 +0100 2) Apple Pie
    3928beef (Chris Haigh 2018-09-01 10:32:40 +0100 3) Cheesecake
    d547b527 (Chris Haigh 2018-09-15 13:03:27 +0100 4) Chicken Tikka Masala
    cc9be1b0 (Chris Haigh 2018-09-15 15:30:27 +0100 5) Guacamole
    f18bc674 (Chris Haigh 2018-09-16 15:52:37 +0100 6) Caesar Salad

#>

# see corresponding log
git log --graph --oneline --decorate
<#

    * f18bc67 (HEAD -> master) Add Caesar Salar to menu
    * 07b7cf8 Make README all uppercase
    *   becf2cc Merge branch 'tomato'
    |\
    | * d19f975 (tomato) Add tomato to guacamole
    * | 7a12c1a Add onion to guacamole
    |/
    * cc9be1b Add guacamole
    * 48aba0c Well, I changed my mind about that renaming
    * e733ef5 Use Markdown for the menu
    * d547b52 Add Tikka Masala to menu
    * 022ba96 (tag: dinner, spaghetti) Add carbonara ingredients
    * f6ac104 Add spaghetti alla carbonara
    *   f6effc9 (lisa) Merge branch 'lisa'
    |\
    | * 196735c Add Lisa's version of the pie
    * | 19a9e91 Added recipe
    |/
    * 3928bee (tag: mytag) Add cake
    * e79f317 First commit!

#>

# chicken tikka masala was added in d547b52
# cheesecake was added in 3928bee

# add CTM recipe, stage and commit
$chickenTikkaMasalaRecipe = @"
Chicken Tikka Masala

Chicken
Yoghurt
Delicious Spices
"@

Add-Content .\recipes\chicken_tikka_masala.txt $chickenTikkaMasalaRecipe

git add .\recipes\chicken_tikka_masala.txt
git commit --message "Add missing chicken tikka masala placeholder"

# see log
git log --oneline --decorate --graph
<#

    * 435f944 (HEAD -> master) Add missing chicken tikka masala placeholder
    * f18bc67 Add Caesar Salar to menu
    * 07b7cf8 Make README all uppercase
    *   becf2cc Merge branch 'tomato'
    |\
    | * d19f975 (tomato) Add tomato to guacamole
    * | 7a12c1a Add onion to guacamole
    |/
    * cc9be1b Add guacamole
    * 48aba0c Well, I changed my mind about that renaming
    * e733ef5 Use Markdown for the menu
    * d547b52 Add Tikka Masala to menu
    * 022ba96 (tag: dinner, spaghetti) Add carbonara ingredients
    * f6ac104 Add spaghetti alla carbonara
    *   f6effc9 (lisa) Merge branch 'lisa'
    |\
    | * 196735c Add Lisa's version of the pie
    * | 19a9e91 Added recipe
    |/
    * 3928bee (tag: mytag) Add cake
    * e79f317 First commit!

#>

# use --interactive flag to enable powerful history editing tool
# this opens all changes from a specific revision onwards into a text editor to allow history rewriting like it is a history-editing script

# history from 'f6effc9' onwards
git rebase --interactive f6effc9
<#

    pick f6ac104bbd7182756d6464ebedd477785987987e Add spaghetti alla carbonara
    pick 022ba96e1ecd4ef9f134a11395b04387e54850f0 Add carbonara ingredients
    pick d547b5277a227b3fd8dc1d13902e09c97af02bfc Add Tikka Masala to menu
    pick e733ef51e636e69dc49bbf7cf8bb916139bfebde Use Markdown for the menu
    pick 48aba0cd7fef991582da5c58e3760ee2d1d2a879 Well, I changed my mind about that renaming
    pick cc9be1b07dad99f6fbca98e7409a21c55d22583c Add guacamole
    pick 7a12c1a18253e9cb8ffd17ff979e139b49966384 Add onion to guacamole
    pick 7ee36246bc2485805f99acf61ff3f509cc1822db Add tomato to guacamole
    pick e555f209e0780b6eb81ac04171dc0be87644b5df Make README all uppercase
    pick e6e0c4278fc6b79f3d2495d87fe8a6252233565e Add Caesar Salar to menu
    pick 295d9732798bb3307371fcd00ee900e524c8f77b Add missing chicken tikka masala placeholder

    # Rebase e79f317..295d973 onto e79f317 (14 commands)
    #
    # Commands:
    # p, pick <commit> = use commit
    # r, reword <commit> = use commit, but edit the commit message
    # e, edit <commit> = use commit, but stop for amending
    # s, squash <commit> = use commit, but meld into previous commit
    # f, fixup <commit> = like "squash", but discard this commit's log message
    # x, exec <command> = run command (the rest of the line) using shell
    # d, drop <commit> = remove commit
    # l, label <label> = label current HEAD with a name
    # t, reset <label> = reset HEAD to a label
    # m, merge [-C <commit> | -c <commit>] <label> [# <oneline>]
    # .       create a merge commit using the original merge commit's
    # .       message (or the oneline, if no original merge commit was
    # .       specified). Use -c <commit> to reword the commit message.
    #
    # These lines can be re-ordered; they are executed from top to bottom.
    #
    # If you remove a line here THAT COMMIT WILL BE LOST.
    #
    #	However, if you remove everything, the rebase will be aborted.
    #
    #	
    # Note that empty commits are commented out

#>