function update
  paru 
  flatpak update
  flatpak uninstall --unused
  orphan
end
