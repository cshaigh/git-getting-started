# merge master into lisa
git checkout lisa
git merge master
<#

    Updating 196735c..f6effc9
    Fast-forward
    recipes/apple_pie.txt | 2 +-
    1 file changed, 1 insertion(+), 1 deletion(-)

#>
# fast-forward message is where git realises that master already contains latest master + latest lisa, so just moves lisa pointer to same as master pointer