# ~/.bashrc: executed by bash(1) for non-login shells.
# vim: set sw=4 ts=4 sts=4 et tw=78 foldlevel=0 foldmethod=marker spell:
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
    *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth
export PAGER='less'

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

# If this is an xterm set the title to user@host:dir
case "$TERM" in
    xterm*|rxvt*)
        PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
        ;;
    *)
        ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export PATH=$PATH:/sbin/:/usr/sbin/:/usr/lib/jvm/java-8-jdk/bin/:/home/juliosueiras/Documents/SchoolWork/JavaFolders/Test_CI/bluecloth/bin/
export JAVA_HOME=/usr/lib/jvm/java-8-jdk/

# some more ls aliases
alias ll='ls -ahlF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

export WINEARCH=win32
export PATH="$HOME/.linuxbrew/bin:$PATH"
export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"

export NVM_DIR="/home/juliosueiras/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
export TERM=xterm-256color
alias google-chrome="google-chrome --single-process"
[ -n "$FBTERM" ] && export TERM=fbterm
export EDITOR='vim'
alias multitailSysMsg="multitail -f /var/log/{dmesg,syslog}"
alias mux=tmuxinator
source /usr/bin/virtualenvwrapper.sh
alias venvwrapper=virtualenvwrapper
export DISPLAY=":0"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

. /usr/bin/liquidprompt

export PATH=$PATH:/home/juliosueiras/.config/bspwm/panel
export PATH=$PATH:/home/juliosueiras/.scripts

export LC_ALL=en_US.UTF-8
alias connectToSchool='sudo wpa_supplicant -iwlp2s0 -c/etc/wpa_supplicant/wpa_supplicant.conf'
export hlalib=/usr/lib/hlalib.a
export hlainc=/usr/include
export PATH="$PATH:$HOME/bazel/output"
export PROJECT_HOME=/home/juliosueiras/School/side_projects/django_projects
export POSTGRES_USERNAME=postgres
export POSTGRES_PASSWORD=admin
alias mountAtlas="sshfs tainsuej@atlas.sheridanc.on.ca: /home/juliosueiras/School/summer_2015/applied_operating_system_design/atlas_folder"
alias vim="vim --servername VIM"
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

xhost +local:root > /dev/null 2>&1

complete -cf sudo

shopt -s cdspell
shopt -s checkwinsize
shopt -s cmdhist
shopt -s dotglob
shopt -s expand_aliases
shopt -s extglob
shopt -s histappend
shopt -s hostcomplete
shopt -s nocaseglob

#exports
export HISTSIZE=10000
export HISTFILESIZE=${HISTSIZE}
export HISTCONTROL=ignoreboth

# I this is an xterm set the title to user@host:dir
case "$TERM" in
    xterm*|rxvt*)
        PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u: \w\a\]$PS1"
        ;;
    *)
        ;;
esac

# Colored prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        color_prompt=yes
    else
        color_prompt=
    fi
fi

# Prompt
if [ -n "$SSH_CONNECTION" ]; then
    export PS1="\[$(tput setaf 1)\]┌─╼ \[$(tput setaf 7)\][\w]\n\[$(tput setaf 1)\]\$(if [[ \$? == 0 ]]; then echo \"\[$(tput setaf 1)\]└────╼ \[$(tput setaf 7)\][ssh]\"; else echo \"\[$(tput setaf 1)\]└╼ \[$(tput setaf 7)\][ssh]\"; fi) \[$(tput setaf 7)\]"
else
    export PS1="\[$(tput setaf 1)\]┌─╼ \[$(tput setaf 7)\][\w]\n\[$(tput setaf 1)\]\$(if [[ \$? == 0 ]]; then echo \"\[$(tput setaf 1)\]└────╼\"; else echo \"\[$(tput setaf 1)\]└╼\"; fi) \[$(tput setaf 7)\]"
fi

trap 'echo -ne "\e[0m"' DEBUG
# Auto-completion
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

# Go back with ..
b() {
    str=""
    count=0
    while [ "$count" -lt "$1" ];
    do
        str=$str"../"
        let count=count+1
    done
    cd $str
}

# Color man pages
man() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;38;5;74m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[38;5;246m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;38;5;146m' \
    man "$@"
}

# Auto cd
shopt -s autocd

# ls after a cd
function cd()
{
    builtin cd "$*" && ls
}
set editing-mode vi
# if [ -n "$PS1" ]; then
#     eval "$(~/.git_repos/base16-shell/profile_helper.sh)"
# fi

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
# BASE16_SHELL="$HOME/.git_repos/base16-shell/base16-default.dark.sh"
# [[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

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
source ~/.commacd.bash
export PATH="$PATH:$HOME/go/bin"
alias fuck='thefuck $(fc -ln -1)'

export PATH=~/bin:$PATH
export PATH=/usr/share/perl5/vendor_perl/auto/share/dist/Cope:/home/juliosueiras/bin:/home/juliosueiras/.linuxbrew/bin:/usr/share/perl5/vendor_perl/auto/share/dist/Cope:/home/juliosueiras/.dnx/runtimes/dnx-mono.1.0.0-beta4/bin:/home/juliosueiras/.k/runtimes/kre-mono.1.0.0-beta3/bin:/home/juliosueiras/.rvm/gems/ruby-2.2.1/bin:/home/juliosueiras/.rvm/gems/ruby-2.2.1@global/bin:/home/juliosueiras/.rvm/rubies/ruby-2.2.1/bin:/home/juliosueiras/bin:/home/juliosueiras/.linuxbrew/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/opt/android-sdk/platform-tools:/opt/android-sdk/tools:/opt/devkitpro/devkitARM/bin:/usr/share/java/gradle/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/opt/staruml/:/sbin/:/usr/sbin/:/usr/lib/jvm/java-8-jdk/bin/:/home/juliosueiras/Documents/SchoolWork/JavaFolders/Test_CI/bluecloth/bin/:/home/juliosueiras/.fzf/bin:/home/juliosueiras/.config/bspwm/panel:/home/juliosueiras/.scripts:/home/juliosueiras/bazel/output:/home/juliosueiras/.rvm/bin:/home/juliosueiras/go/bin:/home/juliosueiras/.rvm/bin:/home/juliosueiras/.config/bspwm/panel:/home/juliosueiras/.scripts:/home/juliosueiras/.rvm/bin:/sbin/:/usr/sbin/:/usr/lib/jvm/java-8-jdk/bin/:/home/juliosueiras/Documents/SchoolWork/JavaFolders/Test_CI/bluecloth/bin/:/home/juliosueiras/.config/bspwm/panel:/home/juliosueiras/.scripts:/home/juliosueiras/bazel/output:/home/juliosueiras/.rvm/bin:/home/juliosueiras/go/bin
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
alias vimb='tabbed -c vimb -e'

# added by travis gem
[ -f /home/juliosueiras/.travis/travis.sh ] && source /home/juliosueiras/.travis/travis.sh
set -o vi
alias csc=mcs
export CHEATCOLORS=true
export M2_HOME=/opt/maven/

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$HOME/.node/bin:$PATH"

SSH_AUTH_SOCK=/run/user/1000/keyring/ssh
GPG_AGENT_INFO=/run/user/1000/keyring/gpg:0:1

export PDFVIEWER=zathura
eval $(dircolors ~/.dircolors)
