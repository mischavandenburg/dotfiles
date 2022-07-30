source ~/git/zsh-snap/znap.zsh
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# znap plugins from github repos
znap source romkatv/powerlevel10k
znap source zsh-users/zsh-autosuggestions

# keybinds
# bind accept suggestion to control space
bindkey '^ ' autosuggest-accept
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line

# SSH CONFIGURATION
# This script checks if ssh agent is running, starts ssh agent if needed and loads the keys.  

if [ $(ps ax | grep "[s]sh-agent" | wc -l) -eq 0 ] ; then
    eval $(ssh-agent -s) > /dev/null
    if [ "$(ssh-add -l)" = "The agent has no identities." ] ; then
        # Auto-add ssh keys to your ssh agent
        # Example:
        # ssh-add ~/.ssh/id_rsa > /dev/null 2>&1
    fi
fi

# adding keys was buggy, add them outside of the script for now
ssh-add -q ~/.ssh/mischa
ssh-add -q ~/.ssh/mburg

# custom variables
export CLOUD="/Users/mischa/Library/Mobile Documents/com~apple~CloudDocs"
export GDRIVE="/Users/mischa/Google Drive/My Drive"
export VISUAL=nvim
export EDITOR=nvim
# export PATH=$PATH:/usr/local/bin/:/Users/mischa/Library/Python/3.8/bin

export PATH=$PATH:/usr/local/bin/

# Set history file 
HISTFILE="$HOME/.zsh_history"
# Number of events loaded into memory
HISTSIZE=10000
# Number of events stored in the zsh history file
SAVEHIST=10000

# terminal colors
export LS_COLORS='di=0;31'

#  custom aliases
alias ca="cd ~/git/Openstack/"
alias v="nvim"
alias ..="cd .."
alias c="clear"
alias ls='ls --color=auto'
alias ll='ls -la'
alias la='ls -la'
alias sv='sudoedit'
alias sk='killall ssh-agent && source ~/.zshrc'
alias t='tmux'
alias e='exit'
alias gp='git pull'
# fzf aliases
# use fp to do a fzf search and preview the files
alias fp="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"
# search for a file with fzf and open it in vim
alias vf='v $(fzf)'


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# OS specific 

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        # ...

# source the keybindings for ubuntu
if grep -q ubuntu /etc/os-release; then
  source /usr/share/doc/fzf/examples/key-bindings.zsh
fi

# source for manjaro
if grep -q manjaro /etc/os-release; then
  source /usr/share/fzf/key-bindings.zsh
  
  # for pyenv
  eval "$(pyenv init -)"

fi

elif [[ "$OSTYPE" == "darwin"* ]]; then

# Mac OSX
# source the bindings for mac
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# pyenv
# eval "$(pyenv virtualenv-init -)"
eval "$(pyenv init -)"

elif [[ "$OSTYPE" == "cygwin" ]]; then
        # POSIX compatibility layer and Linux environment emulation for Windows
elif [[ "$OSTYPE" == "msys" ]]; then
        # Lightweight shell and GNU utilities compiled for Windows (part of MinGW)
elif [[ "$OSTYPE" == "win32" ]]; then
        # I'm not sure this can happen.
elif [[ "$OSTYPE" == "freebsd"* ]]; then
        # ...
else
        # Unknown.
fi

# use this for using asdf if needed 
# . /usr/local/opt/asdf/libexec/asdf.sh

