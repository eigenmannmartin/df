export PATH="$PATH:$HOME/.local/bin"
export PATH="~/.npm-global/bin:$PATH"
export OP_BIOMETRIC_UNLOCK_ENABLED=true
export EDITOR=nvim
export GIT_EDITOR=$EDITOR
export SSH_AUTH_SOCK=~/.1password/agent.sock

#export PYENV_ROOT="$HOME/.pyenv"
#command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
#eval "$(pyenv init -)"
source ~/.alias
# Generated for envman. Do not edit.
#[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

eval "$(starship init zsh)"

export CLOUDSDK_CONFIG=/home/martin/.gcloud
export HISTFILESIZE=20000
export HISTSIZE=10000
export HISTFILE=~/.zsh_history
setopt HIST_FIND_NO_DUPS
setopt INC_APPEND_HISTORY
