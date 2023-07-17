# dots

dot files

clear;find -maxdepth 1 -type f -name .\\\*|grep -Ev '(history|viminfo)'|xargs grep -c LS_COLORS|awk -F: '$2>0\{print $1\}'|sort

1029e45e4ca701eefd4956047455c9dac5ed4b982856253af14424bb debDots2307.zip

4e5415ad744bf2c3763e341afcfdb1c86d08d94e87ce2ac69c4b9e1a slackDots2307.zip
