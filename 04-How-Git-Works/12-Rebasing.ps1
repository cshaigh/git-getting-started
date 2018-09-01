# setup spaghetti branch
git branch spaghetti
git checkout spaghetti
@("Spaghetti alla Carbonara", (Get-Content .\menu.txt)) | Set-Content .\menu.txt
git add .\menu.txt
git commit --message "Add spaghetti alla carbonara"

$spaghettiRecipe = @"
Spaghetti alla Carbonara

1 lb spaghetti
2 tbsp oil
4 oz diced bacon
1 onion
3 eggs
1 cup permesan cheese
1 handful parsley
salt and pepper
"@

Set-Content .\recipes\spaghetti_alla_carbonara.txt -Value $spaghettiRecipe
git add .\recipes\spaghetti_alla_carbonara.txt
git commit --message "Add carbonara ingredients"

git branch --list
<#

    lisa
    master
    nogood
    * spaghetti

#>

# rebase master branch to current (takes master branch commits and applies to spaghetti)
git rebase master

# rebase spaghetti branch to master
git checkout master
git rebase spaghetti
<#

    First, rewinding head to replay your work on top of it...
    Fast-forwarded master to spaghetti.

#>
git log --oneline
<#

    022ba96 (HEAD -> master, spaghetti) Add carbonara ingredients
    f6ac104 Add spaghetti alla carbonara
    f6effc9 (lisa) Merge branch 'lisa'
    196735c Add Lisa's version of the pie
    19a9e91 Added recipe
    3928bee (tag: mytag) Add cake
    e79f317 First commit!

#>