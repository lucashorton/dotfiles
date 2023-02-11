# ZSH Config

export $(envsubst < .env)

# Emacs style keybindings
bindkey -e

# History
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt SHARE_HISTORY 
setopt HIST_FIND_NO_DUPS

# Path
export PATH=$HOME/.local/bin:$PATH

#ASDF
. $HOME/.asdf/asdf.sh

# Fuzzy search
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

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
alias docker='podman'
alias history='fc -l 1'
alias u='update'
alias w='weather'
alias vi="nvim"
alias vim="nvim"
alias mutt="neomutt"
alias orphan="yay -Qtdq | yay -Rns -"

# Print greeting
greeting

# Starship

eval "$(starship init zsh)"
