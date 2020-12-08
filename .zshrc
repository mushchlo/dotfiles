export PATH=$HOME/bin:$HOME/.cargo/bin:$HOME/purgatorio/Linux/386/bin:$PATH
if [ "$TERM" = "dumb" ]; then
	PS1=$'%~ '
else
	bindkey -e
	set -o PROMPT_SUBST
	SAVEHIST=10000
	HISTSIZE=10000
	HISTFILE=$HOME/.zsh_history

	autoload -Uz compinit; compinit
	autoload -U history-search-end
	zle -N history-beginning-search-backward-end history-search-end
	zle -N history-beginning-search-forward-end history-search-end
	bindkey '^[[A' history-beginning-search-backward-end
	bindkey '^[[B' history-beginning-search-forward-end
	bindkey '^[[3~' delete-char
	bindkey '^[[H' beginning-of-line
	bindkey '^[[F' end-of-line

	if [[ "$lightmode" != "0" ]]; then
		export BG="f4f4e6"
		export FG="444444"
		export c0="444444"	# black
		export c1="aa6060"	# red
		export c2="639265"	# green
		export c3="9d9d6a"	# yellow
		export c4="7083a0"	# blue
		export c5="82668b"	# purple
		export c6="679a9c"	# cyan
		export c7="616161"	# grey 

		export c8="b2b2b2"	# white
		export c9="c46a6a"	# light red
		export cA="75b77b"	# light green
		export cB="bbbf71"	# light yellow
		export cC="90a8ca"	# light blue
		export cD="b499ba"	# light purple
		export cE="90b9bf"	# light cyan
		export cF="878787"	# light grey
	fi

	prompt_git() {
		[[ "$(git rev-parse --is-inside-work-tree 2>/dev/null)" == "true" ]] && echo "%{\033[92m%} $(git symbolic-ref --short HEAD)"
	}

	err() {
		error=$?
		if [[ $UID == 0 ]]; then
			[[ $error == 0 ]] && echo "%{\033[93m%}" || echo "%{\033[31;5m%}"
		else
			[[ $error == 0 ]] && echo "%{\033[95m%}" || echo "%{\033[91m%}"
		fi
	}
	PS1=$'$(err)%~$(prompt_git)%{\033[0m%} '
	
	if [ "$TERM" = "linux" ]; then
		echo -en "\e]P0$BG"
		echo -en "\e]P1$c1"
		echo -en "\e]P2$c2"
		echo -en "\e]P3$c3"
		echo -en "\e]P4$c4"
		echo -en "\e]P5$c5"
		echo -en "\e]P6$c6"
		echo -en "\e]P7$c7"
		#BOLD
		echo -en "\e]P8$c8"
		echo -en "\e]P9$c9"
		echo -en "\e]PA$cA"
		echo -en "\e]PB$cB"
		echo -en "\e]PC$cC"
		echo -en "\e]PD$cD"
		echo -en "\e]PE$cE"
		echo -en "\e]PF$cF"
		clear
	fi
fi
alias zshconf="vim ~/.zshrc"
alias termconf='vim ~/.config/termite/config && killall -USR1 termite'
alias picomconf='vim ~/.config/picom/picom.conf'
alias dwmconf='olddir="$(pwd)" && cd ~/dwm && rm ~/dwm/config.h; vim ~/dwm/config.def.h && make && sudo make install && killall dwm; cd $olddir'
alias stconf='olddir="$(pwd)" && cd ~/st && rm ~/st/config.h; vim ~/st/config.def.h && make && sudo make install && cd $olddir'
alias barconf='olddir="$(pwd)" && cd ~/dwmblocks && vim blocks.def.h && rm blocks.h && make && sudo make install && cd $olddir && killall dwmblocks; nohup dwmblocks >/dev/null 2>&1 &; disown'
