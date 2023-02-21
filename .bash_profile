eval "$(/opt/homebrew/bin/brew shellenv)"

if [ -r ~/.bashrc ]; then
  source ~/.bashrc
fi

export XDG_CONFIG_HOME="$HOME"/.config
