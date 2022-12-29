function fish_prompt --description 'Write out the prompt'
	set -l color_cwd
    set -l suffix 

    switch "$USER"
        case root toor
            if set -q fish_color_cwd_root
                set color_cwd $fish_color_cwd_root
            else
                set color_cwd $fish_color_cwd
            end
            set suffix '#'
        case '*'
            set color_cwd $fish_color_cwd
            set suffix '🐈  '
    end

    # echo -n -s (__fish_git_prompt '%s') '|' (set_color $color_cwd) (prompt_pwd) (set_color normal) "$suffix"

    set last_status $status

    printf '%s@%s ' (whoami) (prompt_hostname)
    printf '%s ' (__fish_git_prompt)
    set_color $color_cwd
    printf '%s' (prompt_pwd)
    set_color normal
    echo -n $suffix
end
