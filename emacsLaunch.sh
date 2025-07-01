#! /bin/sh

# sh -c "if [ -n \"\$*\" ]; then exec emacsclient --alternate-editor= --display=\"\$DISPLAY\" \"\$@\"; else exec emacsclient --alternate-editor= --create-frame; fi" sh

# -n string       True if the length of string is nonzero.
if test -n "$*"
then
  exec emacsclient --alternate-editor= --display="$DISPLAY" "$@"
else
  exec emacsclient --alternate-editor= --create-frame
fi

