export PATH=$HOME/bin:/usr/local/bin:$PATH
alias vim=nvim
alias ctags="`brew --prefix`/bin/ctags"
alias gl='git log --graph --oneline --all --decorate'
alias tmux="tmux -u"

_has() {
  return $( whence $1 >/dev/null )
}

# fzf via Homebrew
if [ -e /usr/local/opt/fzf/shell/completion.zsh ]; then
  source /usr/local/opt/fzf/shell/key-bindings.zsh
  source /usr/local/opt/fzf/shell/completion.zsh
fi

# fzf via local installation
if [ -e ~/.fzf ]; then
  PATH=$PATH:~/.fzf/bin
  source ~/.fzf/shell/key-bindings.zsh
  source ~/.fzf/shell/completion.zsh
fi

# fzf + ag configuration
if _has fzf && _has ag; then
  export FZF_DEFAULT_COMMAND='ag --nocolor -g ""'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_DEFAULT_OPTS='
  --color fg:242,bg:236,hl:65,fg+:15,bg+:239,hl+:108
  --color info:108,prompt:109,spinner:108,pointer:168,marker:168
  '
fi

export EDITOR="/usr/local/bin/nvim"
ZSH_THEME="spaceship"

# For editing in Vim. run <Ctrl-x><Ctrl-e> to edit
autoload -U edit-command-line
zle -N edit-command-line 
bindkey -M vicmd v edit-command-line
