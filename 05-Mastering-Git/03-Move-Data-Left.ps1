git branch
<#

    lisa
    * master
    nogood
    spaghetti

#>

# see differences between lisa branch and current branch
git diff lisa master
<#

    diff --git a/menu.txt b/menu.txt
    index f1fe985..e4053e4 100644
    --- a/menu.txt
    +++ b/menu.txt
    @@ -1,2 +1,4 @@
    +Spaghetti alla Carbonara
    Apple Pie
    Cheesecake
    +Chicken Tikka Masala
    diff --git a/recipes/spaghetti_alla_carbonara.txt b/recipes/spaghetti_alla_carbonara.txt
    new file mode 100644
    index 0000000..376fdd8
    --- /dev/null
    +++ b/recipes/spaghetti_alla_carbonara.txt
    @@ -0,0 +1,10 @@
    +Spaghetti alla Carbonara
    +
    +1 lb spaghetti
    +2 tbsp oil
    +4 oz diced bacon
    +1 onion
    +3 eggs
    +1 cup permesan cheese
    +1 handful parsley
    +salt and pepper

#>

<#

    git checkout: -

    1. move HEAD to lisa branch commit
    2. copy HEAD from repository to index and working area

#>
git checkout lisa

# return to master branch
git checkout master