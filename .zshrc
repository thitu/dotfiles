autoload -U compinit
compinit
setopt correctall
autoload -U colors
colors

#autoload -U promptinit
#promptinit
unamestr=$(uname)

export EDITOR="/usr/bin/vim"
export HISTSIZE=2000
export HISTFILE="$HOME/.zshhistory"
export SAVEHIST=$HISTSIZE
export PATH="$(brew --prefix)/bin:$PATH"
setopt hist_ignore_all_dups
setopt hist_ignore_space

if [[ "$unamestr" == "Darwin" ]]; then
	alias ls="ls -G"
else
	alias ls="ls --color"
fi
alias reload_zsh="source ~/.zshrc"

# Fix LSCOLORS
export LSCOLORS=DxGxcxdxCxegedabagacad


bindkey -v

setopt prompt_subst 

PROMPT='%{$fg[green]%}%n%{$reset_color%}%{$fg[white]%}@%{$reset_color%}%{$fg[yellow]%}%M%{$reset_color%} %~ > ' 

autoload -Uz vcs_info
zstyle ':vcs_info:*' actionformats \
    '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats       \
    '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'

zstyle ':vcs_info:*' enable git cvs svn hg

# or use pre_cmd, see man zshcontrib
vcs_info_wrapper() {
  vcs_info
  if [ -n "$vcs_info_msg_0_" ]; then
    echo "%{$fg[grey]%}${vcs_info_msg_0_}%{$reset_color%}$del"
  fi
}
RPROMPT=$'$(vcs_info_wrapper)'
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

if [ -e ~/.profile ]; then
  source ~/.profile
fi

# Rails 3 aliases, backwards-compatible with Rails 2.

function _rails_command () {
  if [ -e "script/server" ]; then
    ruby script/$@
  else
    ruby script/rails $@
  fi
}

alias rc='_rails_command console'
alias rd='_rails_command destroy'
alias rdb='_rails_command dbconsole'
alias rdbm='rake db:migrate db:test:clone'
alias rg='_rails_command generate'
alias rgm='_rails_command generate migration'
alias rp='_rails_command plugin'
alias ru='_rails_command runner'
alias rs='_rails_command server'
alias rsd='_rails_command server --debugger'
alias devlog='tail -f log/development.log'
alias rdm='rake db:migrate'
alias rdr='rake db:rollback'

# Sublime Text 2 Aliases
#unamestr = 'uname'

if [[ $('uname') == 'Linux' ]]; then
	alias st='/usr/bin/sublime_text&'
elif  [[ $('uname') == 'Darwin' ]]; then
	alias st='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
fi
alias stt='st .'

alias http='python -m SimpleHTTPServer'

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
