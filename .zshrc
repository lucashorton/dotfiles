# ZSH Config

# Launch sway if on TTY
if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
  exec $HOME/.config/sway/sway.sh 
fi

# Variables
EDITOR=/usr/bin/nvim

# ASDF
. $HOME/.asdf/asdf.sh
fpath=(${ASDF_DIR}/completions $fpath)

# Completion
autoload -Uz compinit
compinit
setopt COMPLETE_ALIASES
zstyle ':completion::complete:*' gain-privileges 1

# Colors
autoload colors; colors

# Syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Functions
function greeting(){
  NAME=$(figlet $HOST)
  echo $fg[cyan]$NAME
  inxi
}

function orphan() {
  yay -Qtdq | yay -Rns -
}

function update() {
  yay 
  flatpak update
  flatpak uninstall --unused
  orphan
}

function weather() {
  curl wttr.in
}

# Aliases
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias u="update"
alias w="weather"

# Print greeting
greeting

# Prompt
eval "$(starship init zsh)"
