# ZSH Config
if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
#  exec sway-run
fi

# History
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt SHARE_HISTORY 
setopt HIST_FIND_NO_DUPS

# Variables
EDITOR=/usr/bin/nvim

# Path
export PATH=$HOME/.local/bin:$PATH

#ASDF
. $HOME/.asdf/asdf.sh

# Fuzzy search
#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Colors
autoload colors; colors

# Functions
function greeting(){
  NAME=$(figlet $HOST)
  echo $fg[green]$NAME
  inxi
  echo ""
}

function update() {
  yay 
  flatpak update
}

function weather() {
  curl wttr.in
}

function gogh() {
  bash -c "$(wget -qO- https://git.io/vQgMr)"
}

# Aliases
alias orphan='yay -Rsn $(yay -Qtdq)'
alias docker='podman'
alias history='fc -l 1'
alias u='update'
alias w='weather'
alias start='$HOME/.config/sway/sway.sh'
alias vi="nvim"
alias vim="nvim"
alias mutt="neomutt"

# Print greeting
# greeting

# Starship

eval "$(starship init zsh)"
