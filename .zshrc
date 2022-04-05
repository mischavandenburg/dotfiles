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

# ssh
eval $(ssh-agent)
ssh-add ~/.ssh/mischa
ssh-add ~/.ssh/mburg

# custom variables
export CLOUD="/Users/mischa/Library/Mobile Documents/com~apple~CloudDocs"
export GDRIVE="/Users/mischa/Google Drive/My Drive"
export VISUAL=nvim
export EDITOR=nvim
export PATH=$PATH:/usr/local/bin/

# Set history file 
HISTFILE="$HOME/.zsh_history"
# Number of events loaded into memory
HISTSIZE=10000
# Number of events stored in the zsh history file
SAVEHIST=10000

#  custom aliases
alias ca="cd ~/work/amsterdam/Openstack/"
alias v="nvim"
alias ..="cd .."
alias c="clear"
alias ls='ls --color=auto'
alias ll='ls -la'
alias la='ls -la'
alias sv='sudoedit'

alias t='tmux'
alias e='exit'
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
if grep ubuntu /etc/os-release; then
  source /usr/share/doc/fzf/examples/key-bindings.zsh
fi


# source for manjaro
if grep manjaro /etc/os-release; then
  source /usr/share/fzf/key-bindings.zsh
fi


elif [[ "$OSTYPE" == "darwin"* ]]; then

# Mac OSX
# source the bindings for mac
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


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
