

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
# Settings for the login shell (bash).
#
# Description END

# ~/.bash_logout is executed by bash(1) when login shell exits.
# When the login shell exits, remove problematic files and clear console.

if [ $SHLVL -eq 1 ]; then
  # rm -rf ~/.cache/thumbnails/large/*
  # rm -rf ~/.cache/thumbnails/normal/*
  # rm -rf ~/.cache/sessions/*
  [ -x /usr/bin/clear_console ] && /usr/bin/clear_console -q
fi

# vim:ft=bash

