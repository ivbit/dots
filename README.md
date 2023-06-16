# dots

dot files

clear;find -maxdepth 1 -type f -name .\\\*|grep -Ev '(history|viminfo)'|xargs grep -c LS_COLORS|awk -F: '$2>0\{print $1\}'|sort
