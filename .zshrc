# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

export ZSH_CONFIG_PATH="$HOME/git/semignu/zsh"
source "$ZSH_CONFIG_PATH/zsh-functions"

zsh_add_file 'zsh-aliases'
zsh_add_file 'zsh-prompt'

zsh_add_plugin 'zsh-users/zsh-autosuggestions'
zsh_add_plugin 'zsh-users/zsh-syntax-highlighting'

source <(kubectl completion zsh)
