# rsync only syncs changed files
# usage: rsync_smart in/ out
function rsync_smart
    rsync -avu argv[1] argv[2]
end
