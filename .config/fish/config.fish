# set normal (set_color normal)
# set magenta (set_color magenta)
# set yellow (set_color yellow)
# set green (set_color green)
# set red (set_color red)
# set gray (set_color -o black)
set -Ux VISUAL nvim
set -Ux EDITOR $VISUAL
# source (dirname (status -f))/init.fish

# if tmux is executable and not inside a tmux session, then try to attach.
# if attachment fails, start a new session

if status is-interactive
and not set -q TMUX
    exec tmux
end

set -x PYTHONBREAKPOINT ipdb.set_trace

set -x TERM tmux-256color

 # Fish git prompt
set -x __fish_git_prompt_showdirtystate 'yes'
set -x __fish_git_prompt_showstashstate 'yes'
set -x __fish_git_prompt_showuntrackedfiles 'yes'
set -x __fish_git_prompt_showupstream 'yes'
set -x __fish_git_prompt_color_branch yellow
set -x __fish_git_prompt_color_upstream_ahead green
set -x __fish_git_prompt_color_upstream_behind red


# Proper terminal behavior with unicode
set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8
set -x fish_emoji_width 2

bind -M default v edit_cmd

# for nvim

# Use ipdb for debugging
# set -x PYTHONBREAKPOINT ipdb.set_trace

set -q CC; or set CC clang
set -q CXX; or set CXX $CC++ 

set -x ENABLE_USER_SITE "False"


set -x ENABLE_USER_SITE "False"

set -x PATH /opt/local/bin /opt/local/sbin $PATH
set -x MANPATH /opt/local/share/man (manpath)
set -x PATH $HOME/bin $PATH
set -x PATH $HOME/bin/edirect $PATH
set -x PATH $HOME/.cargo/bin $PATH
set -x PATH $HOME/.gitaliases $PATH
set -x PATH $HOME/edirect $PATH

fish_ssh_agent
