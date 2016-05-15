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
if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# nvm
export NVM_DIR="/Users/vim/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# pyenv
eval "$(pyenv init -)"
