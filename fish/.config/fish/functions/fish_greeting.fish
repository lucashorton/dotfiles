function fish_greeting
  set_color cyan
  figlet $hostname
  set_color normal
  inxi
end
