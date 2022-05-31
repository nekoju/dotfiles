# used to favor Homebrew's Clang (and LLVM) over the stock Apple one.
function brewClang
    set -x PATH /usr/local/opt/llvm/bin $PATH
    set -x LDFLAGS "-L/usr/local/opt/llvm/lib -Wl,-rpath,/usr/local/opt/llvm/lib"
    # set -x LDFLAGS "-L/Library/Frameworks/R.framework/Resources/lib"
end
