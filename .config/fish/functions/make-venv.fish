function make-venv --wraps='python3 -m venv ' --description 'alias make-venv python3 -m venv '
  set test_or $argv[1] .venv
  set path (realpath $test_or[1])
  echo creating virtual environment at $path
  set command 's;set -gx _OLD_FISH_PROMPT_OVERRIDE "$VIRTUAL_ENV";&\n    set -x PYTHONPATH '(dirname $path)';'
  python3 -m venv $path; 
  gsed -i $command $path/bin/activate.fish
end
