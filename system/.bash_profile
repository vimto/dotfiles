# Resolve DOTFILES_DIR
READLINK=$(which readlink)
CURRENT_SCRIPT=$BASH_SOURCE
SCRIPT_PATH=$($READLINK -n "$CURRENT_SCRIPT")
DOTFILES_DIR=$(dirname "$(dirname "$SCRIPT_PATH")")

# Run customisation files in system directory
for DOTFILE in "$DOTFILES_DIR"/system/.{functions,path,env,alias,prompt}; do
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
chruby ruby-2.3.4

# nvm
# Depends on brew install nvm
export NVM_DIR="$HOME/.nvm"
. "$(brew --prefix nvm)/nvm.sh"

# pyenv
# eval "$(pyenv init -)"
