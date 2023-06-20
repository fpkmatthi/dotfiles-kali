# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

set -o vi

# User configuration {{{
# You may need to manually set your language environment
# export LANG=en_GB.UTF-8
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
# }}}

# Shell variables {{{
export EDITOR='vim'
export TERMINAL="urxvt"
export BROWSER="firefox"
export XDG_CONFIG_HOME="$HOME/.config"
# export TERM="xterm-256color"
export GPG_TTY=$(tty)
export _JAVA_AWT_WM_NONREPARENTING=1
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on'
# }}}

# Export path {{{
export PATH="$PATH:/home/kali/.local/bin"
export PATH="$PATH:~/go/bin/:/opt/PEzor:/opt/PEzor/deps/donut/:/opt/PEzor/deps/wclang/_prefix_PEzor_/bin/"
export PATH="$PATH:/home/kali/.bin"
# }}}

# Alias' {{{
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
source $HOME/.config/zsh/aliases.sh
# }}}

# FZF {{{
source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/doc/fzf/examples/completion.zsh
export FZF_DEFAULT_OPTS="--height 60% --reverse --preview='(bat --style=numbers --color=always --theme=TwoDark {} || cat {}) 2> /dev/null | head -500' --preview-window=down:10"
export FD_OPTS="--type f --type l --follow --exclude .git" 
export FZF_DEFAULT_COMMAND="fd $FD_OPTS"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# }}}

 #Correction {{{
setopt correct # spelling correction for commands
setopt correctall # spelling correction for arguments

# }}}

# Auto Completion {{{
setopt always_to_end # When completing from the middle of a word, move the cursor to the end of the word
setopt auto_menu # Show completion menu on successive tab press. needs unsetop menu_complete to work
setopt auto_name_dirs # Zny parameter that is set to the absolute name of a directory immediately becomes a name for that directory
setopt complete_in_word # Allow completion from within a word/phrase
unsetopt menu_complete # do not autoselect the first completion entry


autoload -U compinit && compinit
zmodload -i zsh/complist

# man zshcontrib
zstyle ':vcs_info:*' actionformats '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f '
zstyle ':vcs_info:*' enable git #svn cvs

# Enable completion caching, use rehash to clear
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path ~/.zsh/cache/$HOST

# Fallback to built in ls colors
zstyle ':completion:*' list-colors ''

# Make the list prompt friendly
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'

# Make the selection prompt friendly when there are a lot of choices
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'

# Add simple colors to kill
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'

# list of completers to use
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate
zstyle ':completion:*' menu select=1 _complete _ignored _approximate

# match uppercase from lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# offer indexes before parameters in subscripts
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# formatting and messages
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' group-name ''

# ignore completion functions (until the _ignored completer)
zstyle ':completion:*:functions' ignored-patterns '_*'
zstyle ':completion:*:scp:*' tag-order files users 'hosts:-host hosts:-domain:domain hosts:-ipaddr"IP\ Address *'
zstyle ':completion:*:scp:*' group-order files all-files users hosts-domain hosts-host hosts-ipaddr
zstyle ':completion:*:ssh:*' tag-order users 'hosts:-host hosts:-domain:domain hosts:-ipaddr"IP\ Address *'
zstyle ':completion:*:ssh:*' group-order hosts-domain hosts-host users hosts-ipaddr
zstyle '*' single-ignored show
# }}}

# Prompt {{{
export PS1='%F{012}%n%f%F{010}@%f%F{012}%m%f %F{010}>%f '
export RPROMPT='%F{010}%~%f'
# }}}

# Pyenv {{{
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
# }}}
