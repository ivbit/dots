#! /bin/sh

# Edit file '~/.config/mimeapps.list', or use command line:

# xdg-mime query default 'x-scheme-handler/https'

# clear;for m in $(awk '$1!="#"&&$4{print substr($4,2,length($4)-2)}' ./mimeDefault.sh);do echo $m:;xdg-mime query default $m;echo;done
# clear;awk '$1!="#"&&$4{$4=substr($4,2,length($4)-2);print $4":";system("xdg-mime query default " $4);print ""}' ./mimeDefault.sh

xdg-mime default 'gvim.desktop' 'application/javascript'
xdg-mime default 'gvim.desktop' 'application/x-shellscript'
xdg-mime default 'org.xfce.mousepad.desktop' 'text/plain'
xdg-mime default 'gvim.desktop' 'text/tcl'
xdg-mime default 'gvim.desktop' 'text/tm'
xdg-mime default 'gvim.desktop' 'text/x-python'
xdg-mime default 'gvim.desktop' 'text/x-python3'
xdg-mime default 'xarchiver.desktop' 'application/x-archive'
xdg-mime default 'xarchiver.desktop' 'application/x-tar'
xdg-mime default 'xarchiver.desktop' 'application/x-tarz'
xdg-mime default 'xarchiver.desktop' 'application/x-compressed-tar'
xdg-mime default 'xarchiver.desktop' 'application/x-bzip-compressed-tar'
xdg-mime default 'xarchiver.desktop' 'application/x-lzip-compressed-tar'
xdg-mime default 'xarchiver.desktop' 'application/x-xz-compressed-tar'
xdg-mime default 'xarchiver.desktop' 'application/x-zstd-compressed-tar'
xdg-mime default 'xarchiver.desktop' 'application/zip'
xdg-mime default 'firefox-esr.desktop' 'text/html'
xdg-mime default 'firefox-esr.desktop' 'text/xml'
xdg-mime default 'firefox-esr.desktop' 'x-scheme-handler/http'
xdg-mime default 'firefox-esr.desktop' 'x-scheme-handler/https'
xdg-mime default 'firefox-esr.desktop' 'x-scheme-handler/ftp'
xdg-mime default 'thunderbird.desktop' 'x-scheme-handler/mailto'
xdg-mime default 'mupdf.desktop' 'application/pdf'
xdg-mime default 'feh.desktop' 'image/bmp'
xdg-mime default 'imv-folder.desktop' 'image/gif'
xdg-mime default 'feh.desktop' 'image/jpg'
xdg-mime default 'feh.desktop' 'image/jpeg'
xdg-mime default 'feh.desktop' 'image/png'
xdg-mime default 'mpv.desktop' 'audio/mpeg'
# xdg-mime default 'mpv.desktop' 'video/mp4'
xdg-mime default 'vlc.desktop' 'video/mp4'
# xdg-mime default 'mpv.desktop' 'video/mpeg'
xdg-mime default 'vlc.desktop' 'video/mpeg'
# xdg-mime default 'mpv.desktop' 'video/x-matroska'
xdg-mime default 'vlc.desktop' 'video/x-matroska'

