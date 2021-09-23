# ZSH Config

# Launch sway if on TTY
if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
  exec $HOME/.config/sway/sway.sh 
fi

# Variables
EDITOR=/usr/bin/nvim

# Path
export PATH=$HOME/.local/bin:$PATH

# History
export HISTFILE=~/.histfile
export HISTSIZE=1000000
export SAVEHIST=1000000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY_TIME
setopt EXTENDED_HISTORY

# Fuzzy search
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ASDF
. /opt/asdf-vm/asdf.sh

# Colors
autoload colors; colors

# Antigen
source ~/.antigen.zsh
antigen init ~/.antigenrc

# Functions
function greeting(){
  NAME=$(figlet $HOST)
  echo $fg[green]$NAME
  inxi
}

function orphan() {
  yay -Qtdq | yay -Rns -
  flatpak uninstall --unused
}

function update() {
  yay 
  flatpak update
  orphan
}

function weather() {
  curl wttr.in
}

# Aliases
alias config='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias docker='podman'
alias history='fc -l 1'
alias u='update'
alias w='weather'

# Print greeting
greeting

