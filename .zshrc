# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e
bindkey "\e[1;3C" forward-word
bindkey "\e[1;3D" backward-word
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^[[3~" delete-char
bindkey "^[[F" end-of-line
bindkey "^[[H" beginning-of-line
bindkey "^[[3;5~" kill-word
bindkey "^H" backward-kill-word

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

# export WSL='true' # Uncomment if running in WSL
export USE_NAME_HOST='true' # Show username and hostname in prompt, comment to hide
export K8S_MAIN_CONTEXT='docker-desktop' # Set main k8s context, will be green
export ZSH_CONFIG_PATH="$HOME/git/semignu/zsh" # Path to zsh config repos
export AZ_CONFIG_PATH="$HOME/.azure" # Path to az config repos

source "$ZSH_CONFIG_PATH/zsh-functions"

if [[ $WSL = 'true' ]] ; then
    zsh_add_file 'zsh-wsl'
fi    
if (command -v dotnet &> /dev/null) ; then
    export PATH="$HOME/.dotnet/tools:$PATH"
fi


zsh_add_file 'zsh-aliases'
zsh_add_file 'zsh-prompt'

zsh_add_plugin 'zsh-users/zsh-autosuggestions'
zsh_add_plugin 'zsh-users/zsh-syntax-highlighting'

source <(kubectl completion zsh)
