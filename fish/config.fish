if status is-interactive
    # Commands to run in interactive sessions can go here
    	set fish_greeting ""
	fastfetch

	alias c="clear"
	alias cd="z"

  	fish_add_path /usr/local/go/bin
  	fish_add_path $HOME/go/bin

  	zoxide init fish | source
	# 	set -g fish_color_param 5cc0e0
	#set -g fish_color_valid_path 5cc0e0
end
