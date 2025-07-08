#! /bin/sh

cd "$HOME/.cache/thumbnails/large" && find -name '???*' -delete
cd "$HOME/.cache/thumbnails/normal" && find -name '???*' -delete
cd "$HOME/.cache/thumbnails/x-large" && find -name '???*' -delete
cd "$HOME/.cache/thumbnails/xx-large" && find -name '???*' -delete

cd "$HOME/.vim/backupdir" && find -name '???*' -delete
cd "$HOME/.vim/swap" && find -name '???*' -delete
cd "$HOME/.vim/undodir" && find -name '???*' -delete

cd "$HOME/.emacs.d/backupdir" && find -name '???*' -delete

cd "$HOME" && find -maxdepth 1 -type f -name '.bash_history-*.tmp' -delete

>&2 printf '\n%s\n\n' 'Cleanup complete!'

