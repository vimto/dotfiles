# Resolve DOTFILES_DIR
READLINK=$(which readlink)
CURRENT_SCRIPT=$BASH_SOURCE
SCRIPT_PATH=$($READLINK -n "$CURRENT_SCRIPT")
DOTFILES_DIR=$(dirname "$(dirname "$SCRIPT_PATH")")

# Run customisation files in system directory
for DOTFILE in "$DOTFILES_DIR"/system/.{functions,env,alias,prompt}; do
  [ -f "$DOTFILE" ] && . "$DOTFILE"
done

# Raise limit for open files and processes
ulimit -S -n 8192

# bash completion
# Depends on brew install git bash-completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi
__git_complete gco _git_checkout

# chruby
# Depends on brew install chruby
source '/usr/local/share/chruby/chruby.sh'
source '/usr/local/share/chruby/auto.sh'
chruby ruby-2.6.3

# nvm
# Depends on brew install nvm
export NVM_DIR="$HOME/.nvm"
. "$(brew --prefix nvm)/nvm.sh"

# Python virtualenvwrapper
# Depends on brew install python && pip install virtualenv virtualenvwrapper
# export WORKON_HOME=$HOME/.virtualenvs
# export PROJECT_HOME=$HOME/code
# source /usr/local/bin/virtualenvwrapper.sh

# heroku autocomplete setup
HEROKU_AC_BASH_SETUP_PATH=/Users/vim/Library/Caches/heroku/autocomplete/bash_setup && test -f $HEROKU_AC_BASH_SETUP_PATH && source $HEROKU_AC_BASH_SETUP_PATH;
