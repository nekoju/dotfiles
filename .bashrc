#!/usr/bin/env bash
# This file runs every time you open a new terminal window.

# Limit number of lines and entries in the history. HISTFILESIZE controls the
# history file on disk and HISTSIZE controls lines stored in memory.
export HISTFILESIZE=50000
export HISTSIZE=50000

export BUILDDIR=/home/$USER/git/glue/compile/builder/componentbuild/
