# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ZSH Config

# Launch sway if on TTY
if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
#   exec sway 
fi

# Variables
EDITOR=/usr/bin/nvim

# Path
export PATH=$HOME/.local/bin:$PATH

#ASDF
. /opt/asdf-vm/asdf.sh

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

function orphan() {
  yay -Qtdq | yay -Rns -
}

function update() {
  yay
  flatpak update
  orphan
}

function weather() {
  curl wttr.in
}

function gogh() {
  bash -c "$(wget -qO- https://git.io/vQgMr)"
}

# Aliases
alias docker='podman'
alias history='fc -l 1'
alias u='update'
alias w='weather'
alias start='$HOME/.config/sway/sway.sh'

# Print greeting
greeting

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
