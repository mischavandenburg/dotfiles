eval "$(/opt/homebrew/bin/brew shellenv)"

if [ -r ~/.bashrc ]; then
  source ~/.bashrc
fi

export XDG_CONFIG_HOME="$HOME"/.config

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/mischa/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)