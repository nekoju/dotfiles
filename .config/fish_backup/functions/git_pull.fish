# combines git pull with git reset --soft in the event of garbage commits
# usage: git pull
function git_pull
    git pull
    if grep -q 'garbage_commit' (git log -1 --pretty=format:%B | psub)
        echo "Garbage commit detected. Doing soft reset"
        git show
        git reset --soft HEAD^
    end
end
