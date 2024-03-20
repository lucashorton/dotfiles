#!/bin/bash

# Path

export PATH=$HOME/.local/bin:$PATH

#ASDF

. $HOME/.asdf/asdf.sh

# SSH Agent

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/gcr/ssh"

# History

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
export HISTCONTROL=ignoreboth
export HISTSIZE=1000

# run-help

run-help() { help "$READLINE_LINE" 2>/dev/null || man "$READLINE_LINE"; }
bind -m vi-insert -x '"\eh": run-help'
bind -m emacs -x     '"\eh": run-help'

# Functions

function gogh() {
  bash -c "$(wget -qO- https://git.io/vQgMr)"
}

function greeting(){
  HOST=$(hostnamectl hostname)
  printf '\033[0;32m'
  figlet "$HOST"
  inxi
}

function update() {
  paru 
  flatpak update
}

# Aliases

alias docker='podman'
alias history='fc -l 1'
alias u='update'
alias w='weather'
alias weather='curl wttr.in'
alias vi="nvim"
alias vim="nvim"
alias mutt="neomutt"
alias orphan="paru -Qtdq | paru -Rns -"

# Command not found
source /usr/share/doc/pkgfile/command-not-found.bash

# Auto cd

shopt -s autocd

# Prompt

greeting
eval "$(starship init bash)"  

# blesh

#[[ $- == *i* ]] && source /usr/share/blesh/ble.sh




. "$HOME/.cargo/env"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/lucas/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/lucas/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/lucas/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/lucas/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

