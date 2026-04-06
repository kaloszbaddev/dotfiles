# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/admin/.zshrc'

autoload -Uz compinit
compinit

autoload -U colors && colors

ll() {
	clear
	echo  "*------------------------ FILES ------------------------*"
	ls -lh $1
	echo  "*-------------------------------------------------------*"
}

alias config='vim $HOME/.config/i3/config'
alias ff='fastfetch -l small'

PROMPT='[%F{001}%n%F{078}@%F{220}%m %F{014}%~%f]%F{247}? '

echo "\e[38;2;173;59;80m God is love [1 John 4:8]\e[0m"

# plugins
# source /usr/share/zsh/plugins/auto-suggest.zsh 2> /dev/null
# source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2> /dev/null

# End of lines added by compinstall

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then exec startx; fi
