# 
# ~/.bash_profile
#
source ~/.dnx/dnvm/dnvm.sh
export MONO_MANAGED_WATCHER=disabled

[[ -f ~/.bashrc ]] && . ~/.bashrc
source ~/.profile

export BROWSER=w3m
alias cp='vcp'
export HP_PORT=8086

[ -s "/home/juliosueiras/.dnx/dnvm/dnvm.sh" ] && . "/home/juliosueiras/.dnx/dnvm/dnvm.sh" # Load dnvm

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

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export PATH="$HOME/.node/bin:$PATH"
source ~/azure.completion.sh
