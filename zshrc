ZSH="$HOME/.oh-my-zsh"

#Theme
ZSH_THEME="agnoster"

#Plugins
plugins=(git)
source $ZSH/oh-my-zsh.sh



export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.npm-local/bin"
export PATH="$PATH:$HOME/.npm-global/bin"
export OP_BIOMETRIC_UNLOCK_ENABLED=true
export EDITOR=nvim
export GIT_EDITOR=$EDITOR
export DOTFILES_REPOSITORY='https://git.sr.ht/\~eigenmannmartin/dotfiles'

#export PYENV_ROOT="$HOME/.pyenv"
#command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
#eval "$(pyenv init -)"
source ~/.alias
# Generated for envman. Do not edit.
#[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
#bindkey "^[[1;5C" forward-word
#bindkey "^[[1;5D" backward-word

#eval "$(starship init zsh)"

export USER=$(whoami)
export CLOUDSDK_CONFIG=/home/$USER/.gcloud
export GOOGLE_APPLICATION_CREDENTIALS=/home/$USER/.gcloud/application_default_credentials.json
export HISTFILESIZE=20000
export HISTSIZE=10000
export HISTFILE=~/.zsh_history
#export SSH_AUTH_SOCK=~/.1password/agent.sock
setopt HIST_FIND_NO_DUPS
setopt INC_APPEND_HISTORY

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

#Start Ship
#eval "$(starship init zsh)"
eval "$(atuin init zsh)"
eval "$(zoxide init --cmd cd zsh)"
