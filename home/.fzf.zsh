# Setup fzf
# ---------
if [[ ! "$PATH" =~ "/home/juliosueiras/.fzf/bin" ]]; then
  export PATH="$PATH:/home/juliosueiras/.fzf/bin"
fi

# Man path
# --------
if [[ ! "$MANPATH" =~ "/home/juliosueiras/.fzf/man" && -d "/home/juliosueiras/.fzf/man" ]]; then
  export MANPATH="$MANPATH:/home/juliosueiras/.fzf/man"
fi

# Auto-completion
# ---------------
[[ $- =~ i ]] && source "/home/juliosueiras/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/juliosueiras/.fzf/shell/key-bindings.zsh"

