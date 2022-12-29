# Defined in - @ line 1
function duall --wraps='du .hs .[^.]* *' --wraps='bash -c du .hs .[^.]* *' --wraps='bash -c du -hs .[^.]* *' --wraps=bash\ -c\ \'du\ -hs\ .\[\^.\]\*\ \*\' --description alias\ duall=bash\ -c\ \'du\ -hs\ .\[\^.\]\*\ \*\'
  bash -c 'du -hs .[^.]* *' $argv;
end
