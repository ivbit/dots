

# Intellectual property information START
# 
# Copyright (c) 2022 Ivan Bityutskiy 
# 
# Permission to use, copy, modify, and distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
# 
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
# ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
# OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
# 
# Intellectual property information END

# Description START
#
# Settings for the non-privileged shell (bash).
#
# Description END

# If non-interactive, don't process .bashrc
case $- in
    *i*) ;;
      *) return;;
esac

# Disallow messages from other users to the tty (security reasons)
2> /dev/null /usr/bin/mesg 'n' || true

# Editor for fc built-in
FCEDIT='/usr/bin/vim'

# Don't put lines starting with space in the history.
HISTCONTROL='ignorespace'

# Append to the history file, don't overwrite it
shopt -s 'histappend'

# Set the history size
HISTSIZE=999
HISTFILESIZE=999

# Check window size after each command, update the values of lines and columns.
shopt -s 'checkwinsize'

# The pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s 'globstar'

# Makes 'echo' to expand backslash escapes without '-e' flag
shopt -s 'xpg_echo'

# Enable programmable completion
if ! shopt -oq 'posix'; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    source /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
  fi
fi

set -o 'vi'
set -o 'noclobber'
set -o 'ignoreeof'

# Set variables to contain special characters
declare chrEsc='\033'
declare strCSI='\033['
# echo \! \? \$ \' \" \` \\ | od -bc
declare chrExc='\041'
declare chrQue='\077'
declare chrDol='\044'
declare chrSqu='\047'
declare chrDqu='\042'
declare chrBqu='\0140'
declare chrBsl='\0134'
# echo "${strCSI}38;2;11;124;76mHello ${strCSI}1mWorld${strCSI}22m${chrExc}${strCSI}0m"

# Prompt
PS1='[\[\033[38;5;22m\]\D{%d.%m %R}\[\033[0m\]] \[\033[01;38;5;22m\]\w\[\033[0m\] \[\033[01;38;5;28m\]\!\[\033[0m\]\$ '
PS2='\[\033[38;5;166m\]>\[\033[0m\] '

# Aliases
# Faster than 'clear', but can scroll up afterwards.
alias cls='printf -- "\033[1;1H\033[0J"'
alias l='less'
alias m='more'
alias h='history 25'
alias jobs='jobs -l'
alias j='jobs'
alias ls='ls --color=auto -F'
alias la='ls -A'
alias lsd='ls -d */'
alias ll='ls -lhA'
alias dots='ls -FlhA $(find . -maxdepth 1 -type "f" -name ".*" | cut -c "3-")'
# \033]0; - title, \033]1; -icon, \033]2; - title
alias set_title='printf -- "\033]0;${PWD}\07"'
alias ..='cd ..'
alias pd='pushd'
alias po='popd'
alias dirs='dirs -v'
alias grep='grep --color=auto -i'
alias du='du -sh'
alias df='df -h'
alias rmo='rm *_original'
alias askrm='rm -i'
alias askcp='cp -i'
alias askmv='mv -i'
alias psg='ps -ef | grep'
alias psu='ps -u "$LOGNAME"'
alias cnf='command-not-found --ignore-installed'
alias mtt='~/Tools/fetchContent/fetchContentV3.ksh'
alias wtr='~/Tools/getWeather/getWeatherRus.sh'
alias cred='~/Tools/getCred/getCred.sh'
alias cdate='date -d "now + 3 months" "+%nThree months from today: %d.%m.%Y%n"'
alias ndate="date -d 'now + 150 minutes' '+%nNext 2.5 hours at %R%n'"
alias finfo='~/Tools/fileInfo/fileInfoSpecial.ksh'
alias today="date '+%n%A %d %B %Y, %R:%S%n'"
alias usd="curl -s 'https://www.cbr.ru/currency_base/daily/' | grep -A 10 'USD' | gawk -F '[<>]' 'BEGIN { print } NR ~ /[148]\$/ { print \$3 } END { printf ORS }'"
alias sps1="PS1='\[\033[1;38;5;28m\]\!\[\033[0m\]\$ '"
alias lps1="PS1='[\[\033[38;5;22m\]\D{%d.%m %R}\[\033[0m\]] \[\033[1;38;5;22m\]\w\[\033[0m\] \[\033[1;38;5;28m\]\!\[\033[0m\]\$ '"

# vim ft=bash

