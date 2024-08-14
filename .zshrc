# ~~~~~~~~~~~~~~~ Path configuration ~~~~~~~~~~~~~~~~~~~~~~~~

# Enable Zsh's extended globbing and null_glob options
setopt extended_glob null_glob

# Define an array of directories to add to PATH
path=(
    $path                           # Keep existing PATH entries
    $HOME/bin
    $HOME/.local/bin
    $HOME/dotnet
    $SCRIPTS
    $HOME/.krew/bin
    $HOME/.rd/bin                   # Rancher Desktop
    # $HOME/*/bin(N)                # Add all bin directories under HOME
    # /usr/local/*/bin(N)           # Add all bin directories under /usr/local
)

# Remove duplicate entries and non-existent directories
typeset -U path
path=($^path(N-/))

# Export the updated PATH
export PATH


# ~~~~~~~~~~~~~~~ SSH ~~~~~~~~~~~~~~~~~~~~~~~~

# Start the SSH agent with a lifetime of 4 hours if not running already
# From Arch wiki.

# if ! pgrep -u "$USER" ssh-agent > /dev/null; then
#     ssh-agent -t 4h > "$XDG_RUNTIME_DIR/ssh-agent.env"
# fi
# if [[ ! -f "$SSH_AUTH_SOCK" ]]; then
#     source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
# fi
#
# # Check if keys are added.
# # If no keys are found (exit code 1), add the specified keys.
#
# ssh-add -l &>/dev/null
#
# if [ "$?" -eq 1 ]; then
#     if [[ "$OSTYPE" == darwin* ]]; then
#
#         # Get the password from the Apple Keychain when running on MacOS
#         ssh-add --apple-use-keychain -t 4h "$HOME/.ssh/gh_macbook_pro" 2>/dev/null
#     else
#         ssh-add -t 4h "$HOME/.ssh/gh_thinkpad_arch" 2>/dev/null
#     fi
# fi


# SSH Through GPG


export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent


# ~~~~~~~~~~~~~~~ Environment Variables ~~~~~~~~~~~~~~~~~~~~~~~~


# Set to superior editing mode
set -o vi

export VISUAL=nvim
export EDITOR=nvim

# config
# export BROWSER="firefox"

# directories
export REPOS="$HOME/Repos"
export GITUSER="mischavandenburg"
export GHREPOS="$REPOS/github.com/$GITUSER"
export DOTFILES="$GHREPOS/dotfiles"
export LAB="$GHREPOS/lab"
export SCRIPTS="$DOTFILES/scripts"
export ICLOUD="$HOME/icloud"
export ZETTELKASTEN="$HOME/Zettelkasten"

# Go related. In general all executables and scripts go in .local/bin
export GOBIN="$HOME/.local/bin"
export GOPRIVATE="github.com/$GITUSER/*,gitlab.com/$GITUSER/*"
# export GOPATH="$HOME/.local/share/go"
export GOPATH="$HOME/go/"

# dotnet
export DOTNET_ROOT="$HOME/dotnet"

# get rid of mail notifications on MacOS
unset MAILCHECK

export TERM="tmux-256color"

# ~~~~~~~~~~~~~~~ History ~~~~~~~~~~~~~~~~~~~~~~~~

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

setopt HIST_IGNORE_SPACE  # Don't save when prefixed with space
setopt HIST_IGNORE_DUPS   # Don't save duplicate lines
setopt SHARE_HISTORY      # Share history between sessions


# ~~~~~~~~~~~~~~~ Prompt ~~~~~~~~~~~~~~~~~~~~~~~~


# Moved to pure prompt 27-07-2024 because it's even cleaner


    if [[ "$OSTYPE" == darwin* ]]; then
      fpath+=("$(brew --prefix)/share/zsh/site-functions")
    else
      fpath+=($HOME/.zsh/pure)
    fi
	    
autoload -U promptinit; promptinit
prompt pure


# ~~~~~~~~~~~~~~~ Aliases ~~~~~~~~~~~~~~~~~~~~~~~~

alias v=nvim

# cd
# alias ..="cd .."
alias scripts='cd $SCRIPTS'
alias cdblog="cd ~/websites/blog"
alias cdpblog='cd $ZETTELKASTEN/2-areas/blog/content'

# Repos

alias lab='cd $LAB'
alias dot='cd $GHREPOS/dotfiles'
alias repos='cd $REPOS'
alias ghrepos='cd $GHREPOS'
alias cdgo='cd $GHREPOS/go/'

alias c="clear"
alias icloud="cd \$ICLOUD"
alias rob='cd $REPOS/github.com/rwxrob'
alias homelab='cd $REPOS/github.com/mischavandenburg/homelab/'
alias hl='homelab'
alias hlp='cd $REPOS/github.com/mischavandenburg/homelab-private/'
alias hlps='cd $REPOS/github.com/mischavandenburg/homelab-private-staging/'
alias hlpp='cd $REPOS/github.com/mischavandenburg/homelab-private-production/'
alias skool='cd $REPOS/github.com/mischavandenburg/skool/'

# ls
alias ls='ls --color=auto'
# alias ll='ls -la'
# alias la='exa -laghm@ --all --icons --git --color=always'
alias la='ls -lathr'

# finds all files recursively and sorts by last modification, ignore hidden files
alias lastmod='find . -type f -not -path "*/\.*" -exec ls -lrt {} +'

alias t='tmux'
alias e='exit'

alias syu='sudo pacman -Syu'

# Azure
alias sub='az account set -s'

# git
alias gp='git pull'
alias gs='git status'
alias lg='lazygit'


# Zettelkasten
alias in="cd \$ZETTELKASTEN/0\ Inbox/"
alias cdzk="cd \$ZETTELKASTEN"


# Kubernetes
alias k='kubectl'

# TODO port kubectl completion
# source <(kubectl completion bash)
# complete -o default -F __start_kubectl k
alias kgp='kubectl get pods'
alias kc='kubectx'
alias kn='kubens'


alias fgk='flux get kustomizations'

# ~~~~~~~~~~~~~~~ Sourcing ~~~~~~~~~~~~~~~~~~~~~~~~

source "$HOME/.privaterc"
source <(fzf --zsh)


# ~~~~~~~~~~~~~~~ Completion ~~~~~~~~~~~~~~~~~~~~~~~~

fpath+=~/.zfunc

if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
fi

autoload -Uz compinit
compinit -u

zstyle ':completion:*' menu select


# Example to install completion:
# talosctl completion zsh > ~/.zfunc/_talosctl


# ~~~~~~~~~~~~~~~ Misc ~~~~~~~~~~~~~~~~~~~~~~~~

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/mischa/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)




