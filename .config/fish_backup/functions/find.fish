# alias for find to exclude .git dir
function find
    command find $argv -not -path '*/\.git'
end
