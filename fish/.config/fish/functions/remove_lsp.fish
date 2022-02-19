function remove_lsp
  cp /usr/share/applications/in.lsp_plug.lsp_plugins_* ~/.local/share/applications
	for i in ~/.local/share/applications/in.lsp_plug.lsp_plugins_*; echo "Hidden=true">>$i; end;
end
