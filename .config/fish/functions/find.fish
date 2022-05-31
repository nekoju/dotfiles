# alias for find to exclude .git dir
function find
    command find $argv[1] -path $argv[1]'*/.git' -prune -o $argv[2..-1]
end
