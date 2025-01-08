# ZSH Config

# uwsm compositor selection
if uwsm check may-start && uwsm select; then
	exec systemd-cat -t uwsm_start uwsm start default
fi

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
  paru 
}

function weather() {
  curl wttr.in
}

function gogh() {
  bash -c "$(wget -qO- https://git.io/vQgMr)"
}

# Aliases
alias history='fc -l 1'
alias u='update'
alias w='weather'
alias vi="nvim"
alias vim="nvim"
alias mutt="neomutt"
alias orphan="paru -Qtdq | paru -Rns -"

# Print greeting
greeting

# Zoxide
eval "$(zoxide init zsh)"

# Mise
eval "$(/usr/bin/mise activate zsh)"

# Starship
eval "$(starship init zsh)"
