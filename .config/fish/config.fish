set -Ux VISUAL nvim
set -Ux EDITOR $VISUAL
fish_vi_key_bindings
# source (dirname (status -f))/init.fish

# if tmux is executable and not inside a tmux session, then try to attach.
# if attachment fails, start a new session

# set -x TERMINFO $TERMINFO $HOME/.local/share/terminfo/74/
# set -x TERM tmux-256color
# if status is-interactive
# and not set -q TMUX
#     exec tmux
# end

set -x PYTHONBREAKPOINT ipdb.set_trace

# Proper terminal behavior with unicode
set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8
set -x fish_emoji_width 2

bind -M default v edit_cmd

# for nvim

# Use ipdb for debugging
set -x PYTHONBREAKPOINT ipdb.set_trace

set -x JAVA_HOME /usr/local/opt/openjdk/bin

set -q CC; or set CC clang
set -q CXX; or set CXX $CC++ 

set -gx LDFLAGS "-L/usr/local/opt/bzip2/lib"
set -gx CPPFLAGS "-I/usr/local/opt/bzip2/include"
set -gx LDFLAGS $LDFLAGS "-L/usr/local/opt/llvm/lib -Wl,-rpath,/usr/local/opt/llvm/lib"
set -gx CPPFLAGS $CPPFLAGS "-I/usr/local/opt/llvm/include -I/usr/local/opt/llvm/include/c++/v1/"

set -x ENABLE_USER_SITE "False"
set -x PATH /opt/local/bin /opt/local/sbin $PATH
set -x MANPATH /opt/local/share/man (manpath)
set -x PATH $HOME/bin $PATH
set -x PATH $HOME/.cargo/bin $PATH
set -x PATH $HOME/.gitaliases $PATH
set -x PATH /usr/local/bin $PATH
set -x PATH /usr/local/cmake/bin $PATH

# set -gx LDFLAGS "-L/usr/local/opt/bzip2/lib"
# set -gx CPPFLAGS "-I/usr/local/opt/bzip2/include"
# set -gx LDFLAGS $LDFLAGS "-L/usr/local/opt/llvm/lib -Wl,-rpath,/usr/local/opt/llvm/lib"
# set -gx CPPFLAGS $CPPFLAGS "-I/usr/local/opt/llvm/include -I/usr/local/opt/llvm/include/c++/v1/ -I$JAVA_HOME/include -I$JAVA_HOME/include/darwin"


fish_ssh_agent

thefuck --alias | source
oh-my-posh init fish --config ~/.config/fish/dracula.omp.json | source
