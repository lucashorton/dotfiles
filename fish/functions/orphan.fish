function orphan
  if yay -Qtdq
    yay -Qtdq | yay -Rns -
  else
    echo "There are no orphans to remove"
  end
end
