# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# start znap
source ~/git/zsh-snap/znap.zsh

# znap plugins from github repos
znap source romkatv/powerlevel10k
znap source zsh-users/zsh-autosuggestions

# keybinds
# bind accept suggestion to control space
bindkey '^ ' autosuggest-accept

# ssh
ssh-add ~/.ssh/mburg

# custom variables
export CLOUD="/Users/mischa/Library/Mobile Documents/com~apple~CloudDocs"
export GDRIVE="/Users/mischa/Google Drive/My Drive"
export VISUAL=nvim
export EDITOR=nvim

#  custom aliases
alias ca="cd ~/work/amsterdam/Openstack/"
alias v="nvim"

alias ls='ls --color=auto'
alias ll='ls -la'
alias la='ls -la'

# fzf aliases
# use fp to do a fzf search and preview the files
alias fp="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"
alias vf='v $(fzf)'


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
