# ZSH Config

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

# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit

# Fuzzy search
source <(fzf --zsh)

# find-the-command
source /usr/share/doc/find-the-command/ftc.zsh

# Colors
autoload colors; colors

# Functions
function greeting(){
  NAME=$(figlet $HOST)
  echo $fg[green]$NAME
  echo ""
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

# Mise
eval "$(/usr/bin/mise activate zsh)"

# Starship
eval "$(starship init zsh)"

SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/gcr/ssh"

