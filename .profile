

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
# Settings for the login shell (either bash or mksh).
#
# Description END

# If running bash
if [ -n "$BASH_VERSION" ]; then
  # Include .bashrc if it exists
  if [ -f "$HOME/.bashrc" ]; then
    source "$HOME/.bashrc"
  fi
fi

# If running mksh
if [ -n "$KSH_VERSION" ]; then
  # Include .mkshrc if it exists
  if [ -f "$HOME/.mkshrc" ]; then
    source "$HOME/.mkshrc"
  fi
fi

# Set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
  PATH="$HOME/bin:$PATH"
fi

# Set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
  PATH="$HOME/.local/bin:$PATH"
fi

# Prevent creation of core dumps
ulimit -c 0

# Block size in kibibytes
export BLOCKSIZE='K'

# Disallow messages from other users to the tty (security reasons)
# 2> /dev/null /usr/bin/mesg 'n' || true

# Language and locale
export LANG='en_US.UTF-8'
export LANGUAGE='en_US:en'
export LC_CTYPE='en_US.UTF-8'

# Terminal emulator
export TERM='xterm-256color'
export COLORTERM='truecolor'

# Pager
export PAGER='/usr/bin/less'

# Text editor
export EDITOR='/usr/bin/vim'
export VISUAL='/usr/bin/vim'

# System path
export PATH="${PATH}:/sbin:/usr/sbin:/usr/local/sbin"

# grep colors for the light theme
export GREP_COLORS='ms=01;38;5;124:mc=01;38;5;166:sl=:cx=:fn=38;5;90:ln=38;5;28:bn=30;48;5;228:se=38;5;19;48;5;255'

# ls colors for the light theme
export LS_COLORS='rs=0:di=01;38;5;19;107:ln=01;38;5;166:mh=00:pi=01;38;5;228;48;5;252:so=01;38;5;90;48;5;252:do=01;38;5;90;48;5;252:bd=01;38;5;22;48;5;252:cd=01;38;5;28;48;5;252:or=01;38;5;160;48;5;252:mi=00:su=01;38;5;252;48;5;160:sg=30;48;5;228:ca=30;48;5;228:tw=97;48;5;22:ow=01;38;5;166;48;5;22:st=97;38;5;19:ex=01;38;5;160:*.tar=01;97;48;5;166:*.gz=01;38;5;22;48;5;228:*.tgz=01;38;5;22;48;5;228:*.lz=01;38;5;22;48;5;228:*.tlz=01;38;5;22;48;5;228:*.z=01;38;5;22;48;5;228:*.tz=01;38;5;22;48;5;228:*.taz=01;38;5;22;48;5;228:*.lzo=01;38;5;22;48;5;228:*.tzo=01;38;5;22;48;5;228:*.lzma=01;38;5;22;48;5;228:*.xz=01;38;5;22;48;5;228:*.txz=01;38;5;22;48;5;228:*.lz4=01;38;5;19;48;5;228:*.zst=01;97;48;5;19:*.tzst=01;97;48;5;19:*.bz=01;38;5;22;48;5;228:*.tbz=01;38;5;22;48;5;228:*.bz2=01;38;5;22;48;5;228:*.tbz2=01;38;5;22;48;5;228:*.cpio=01;38;5;22;48;5;228:*.t7z=01;38;5;52;48;5;228:*.7z=01;38;5;52;48;5;228:*.rar=01;97;48;5;90:*.zip=01;97;48;5;90:*.deb=01;38;5;90;48;5;228:*.tif=01;38;5;128:*.tiff=01;38;5;128:*.bmp=01;38;5;128:*.jpg=01;38;5;128:*.jpeg=01;38;5;128:*.gif=01;38;5;128:*.png=01;38;5;128:*.svg=01;38;5;128:*.svgz=01;38;5;128:*.xwd=01;38;5;128:*.xcf=01;38;5;128:*.xcfgz=01;38;5;128:*.xcfbz2=01;38;5;128:*.psd=01;38;5;128:*.mov=01;38;5;90;107:*.vob=01;38;5;90;107:*.avi=01;38;5;90;107:*.mpg=01;38;5;90;107:*.mpeg=01;38;5;90;107:*.mp4=01;38;5;90;107:*.m4v=01;38;5;90;107:*.mp4v=01;38;5;90;107:*.mkv=01;38;5;90;107:*.ogm=01;38;5;90;107:*.ogv=01;38;5;90;107:*.ogx=01;38;5;90;107:*.webm=01;38;5;90;107:*.flv=01;38;5;90;107:*.aac=01;38;5;28:*.flac=01;38;5;28:*.m4a=01;38;5;28:*.mka=01;38;5;28:*.mp3=01;38;5;28:*.ogg=01;38;5;28:*.wav=01;38;5;28:*.mmp=92;40:*.mmpz=92;40:*.mpt=92;40:*.pdf=01;38;5;30:*.odt=01;48;5;111:*.fodt=01;48;5;111:*.doc=01;48;5;111:*.docm=01;48;5;111:*.docx=01;48;5;111:*.ods=01;48;5;76:*.fods=01;48;5;76:*.xls=01;48;5;76:*.xlsm=01;48;5;76:*.xlsx=01;48;5;76:*.csv=48;5;76:*.odp=01;48;5;203:*.fodp=01;48;5;203:*.ppt=01;48;5;203:*.pptm=01;48;5;203:*.pptx=01;48;5;203:*.odg=01;30;48;5;220:*.fodg=01;30;48;5;220:*.odb=01;48;5;177:*.sqlite3=97;48;5;124:*.sqlite=97;48;5;124:*.db=97;48;5;124:*.sql=97;48;5;124:*.odf=01;30;48;5;252:*.mml=01;30;48;5;252:*.htm=35:*.html=35:*.css=35:*.xml=36:*.xaml=36:*.xsl=36:*.xslt=36:*.tex=97;40:*.aux=97;40:*.md=97;40:*.rmd=97;40:*.ps=97;40:*.ms=97;40:*.c=32:*.cpp=32:*.go=32:*.lisp=32:*.pl=32:*.pm=32:*.py=32:*.rs=32:*.js=32:*.json=32:*.vim=01;38;5;243;48;5;194'

# Display info on console:
echo ''
/usr/bin/date '+%A %d %B %Y'
/usr/bin/uptime | /usr/bin/cut -c '2-'
/usr/bin/who
echo ''

# vim:ft=sh

