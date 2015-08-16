autoload -Uz compinit bashcompinit
compinit
bashcompinit

setopt completealiases
COLORFGBG="default;default"
export EDITOR="vim"
export XDG_CONFIG_HOME="/home/juliosueiras/.config"
export _JAVA_OPTIONS='-Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Dawt.useSystemAAFontSettings=true' 
export JAVA_FONTS=/usr/share/fonts/TTF
source /usr/share/zsh/scripts/antigen/antigen.zsh
antigen use oh-my-zsh
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zaw
antigen bundle git
antigen bundle heroku
antigen bundle pip 
antigen bundle lein
antigen bundle command-not-found
antigen bundle jsontools
antigen bundle node
antigen bundle npm
antigen bundle pyenv
antigen bundle python
antigen bundle sprunge
antigen bundle systemd
antigen bundle fasd
antigen bundle coffee
antigen bundle web-search
antigen bundle django
antigen bundle virtualenv
antigen bundle tmux
antigen bundle archlinux
antigen bundle mvn
antigen bundle git-extras
antigen bundle vi-mode
antigen bundle docker
antigen bundle kennethreitz/autoenv
antigen bundle nojhan/liquidprompt
antigen bundle compleat
antigen bundle colorize
alias cat=colorize
alias virtualenvwrapper.sh=/usr/bin/virtualenvwrapper.sh
source /usr/bin/virtualenvwrapper.sh
source /usr/share/doc/pkgfile/command-not-found.zsh

DEFAULT_USER=juliosueiras
export LANG=en_US.UTF-8
export EDITOR='vim'
export TERM=screen-256color
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export BROWSER=w3m

export DISABLE_AUTO_TITLE="true"
alias vim="vim --servername VIM"
source ~/.git_repos/compleat/compleat_setup

[ -s "/home/juliosueiras/.k/kvm/kvm.sh" ] && . "/home/juliosueiras/.k/kvm/kvm.sh" # Load kvm

[ -s "/home/juliosueiras/.dnx/dnvm/dnvm.sh" ] && . "/home/juliosueiras/.dnx/dnvm/dnvm.sh" # Load dnvm
alias cat=colorize
antigen bundle colorize
alias vdeck='vimdeck generate slides.md && vim presentation/*.md -S script.vim'

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PAGER="vimpager"
alias cat='vimcat'

h() {

	_usage() {
		echo "usage: YOUR_COMMAND | h [-idn] args...
	-i : ignore case
	-d : disable regexp
	-n : invert colors"
	}

	local _OPTS

	# detect pipe or tty
	if test -t 0; then
		_usage
		return
	fi

	# manage flags
	while getopts ":idnQ" opt; do
		case $opt in
			i) _OPTS+=" -i " ;;
			d)  _OPTS+=" -Q " ;;
			n) n_flag=true ;;
			Q)  _OPTS+=" -Q " ;;
				# let's keep hidden compatibility with -Q for original ack users
			\?) _usage
				return ;;
		esac
	done

	shift $(($OPTIND - 1))

	# check maximum allowed input
	if (( ${#@} > 12)); then
		echo "Too many terms. h supports a maximum of 12 groups. Consider relying on regular expression supported patterns like \"word1\\|word2\""
		exit -1
	fi;

	# set zsh compatibility
	[[ -n $ZSH_VERSION ]] && setopt localoptions && setopt ksharrays && setopt ignorebraces

	local _i=0

	if [ -z $n_flag ]; then
		#inverted-colors-last scheme
		_COLORS=( "underline bold red" "underline bold green" "underline bold yellow" "underline bold blue" "underline bold magenta" "underline bold cyan" "bold on_red" "bold on_green" "bold black on_yellow" "bold on_blue" "bold on_cyan" "bold on_magenta" )
	else
		#inverted-colors-first scheme
		_COLORS=( "bold on_red" "bold on_green" "bold black on_yellow" "bold on_blue" "bold on_magenta" "bold on_cyan" "bold black on_white" "underline bold red" "underline bold green" "underline bold yellow" "underline bold blue" "underline bold magenta" )
	fi

	local ACK=ack
	if ! which $ACK >/dev/null 2>&1; then
		ACK=ack-grep
		if ! which $ACK >/dev/null 2>&1; then
			echo "Could not find ack or ack-grep"
			exit -1
		fi
	fi

	# build the filtering command
	for keyword in "$@"
	do
		local _COMMAND=$_COMMAND"$ACK $_OPTS --noenv --flush --passthru --color --color-match=\"${_COLORS[$_i]}\" '$keyword' |"
		_i=$_i+1
	done
	#trim ending pipe
	_COMMAND=${_COMMAND%?}
	#echo "$_COMMAND"
	cat - | eval $_COMMAND
}
antigen bundle autojump
antigen bundle rimraf/k
antigen apply
. ~/.git_repos/z/z.sh
alias fuck=$(thefuck $(fc -ln -1))
antigen bundle unixorn/git-extra-commands
export PATH="$PATH:$HOME/go/bin"
export GOPATH=~/go
BASHISHDIR="/usr/share/bashish"                 ## line added by bashish
TTY=`tty 2>/dev/null` && if test "x$BASHISHDIR" != x;then       ## line added by bashish
test "$BASHISH_OLDPATH"||BASHISH_OLDPATH="$PATH"                ## line added by bashish
PATH="$HOME/.bashish/launcher:$BASHISHDIR/lib:$BASHISH_OLDPATH" ## line added by bashish
BASHSISH_CP=437                                                 ## line added by bashish
TEST_TERM="$TERM" _bashish_utfcheck && BASHISH_CP=utf8          ## line added by bashish
ENV="$HOME/.profile"                                            ## line added by bashish
export BASHISH_CP BASHISH_OLDPATH TTY ENV                       ## line added by bashish
. "$BASHISHDIR/main/prompt/sh/init"                             ## line added by bashish
fi                                                              ## line added by bashish

# added by travis gem
[ -f /home/juliosueiras/.travis/travis.sh ] && source /home/juliosueiras/.travis/travis.sh

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
