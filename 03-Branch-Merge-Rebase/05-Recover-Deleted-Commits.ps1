# didn't mean to delete bug1234 branch!  let's get it back!
git reflog

# create another bug1234 branch based on HEAD@{4} to recover it
git branch "bug1234" "HEAD@{4}"

git graphlog

# bug1234 is back!  let's switch to it
git checkout "bug1234"

# NOTE: git will get rid of old crap after 30 days by default so can't rely on reflog forever