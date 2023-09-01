#!/bin/bash

# Path

export PATH=$HOME/.local/bin:$PATH

#ASDF

. $HOME/.asdf/asdf.sh

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
alias vi="nvim"
alias vim="nvim"
alias mutt="neomutt"
alias orphan="paru -Qtdq | paru -Rns -"


# Command not found
source /usr/share/doc/pkgfile/command-not-found.bash

# Auto cd

shopt -s autocd

# SSH Agent

SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/gcr/ssh"

# Prompt

greeting
eval "$(starship init bash)"  

# blesh

[[ $- == *i* ]] && source /usr/share/blesh/ble.sh




