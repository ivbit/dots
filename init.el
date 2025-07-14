; Emacs init file
; "~/.emacs.d/init.el"

; Copyright (c) 2025 Ivan Bityutskiy 
 
; Permission to use, copy, modify, and distribute this software for any
; purpose with or without fee is hereby granted, provided that the above
; copyright notice and this permission notice appear in all copies.
 
; THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
; WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
; MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
; ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
; WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
; ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
; OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

; Miscellaneous information
; In interactive Emacs session:
; M-x fido-mode                    toggle Fido mode
; In Fido mode, C-x C-f, M-j       choose entered text without auto-completion
; C-[ : | ESC : | M-:              evaluate expression
; M-x eval-expression              (default-value 'tab-width)
; M-x eval-expression              (setq tab-width 8)
; M-x eval-expression              (setq tcl-continued-indent-level 0)
; M-x byte-compile-file            ~/.emacs.d/ivanb-theme.el
; M-x byte-compile-file            ~/.emacs.d/init.el
; C-[ :                            (native-compile "~/.emacs.d/ivanb-theme.el")
; Set white background in terminal emulator, emacs -nw:
; M-x set-background-color         brightwhite
; M-x set-ba                       brightw
; M-x whitespace-mode              toggle whitespace highlighting
; Show trailing whitespace in current buffer:
; C-[ :                            (setq show-trailing-whitespace t)
; M-x delete-trailing-whitespace
; M-x text-mode
; M-x auto-fill-mode
; M-x display-fill-column-indicator-mode
; M-x hl-line-mode
; M-x compare-windows
; M-x ediff

; Extra features through require function
; Enable dired-x, C-x d to call Dired file manager
(require 'dired-x)
; S-<left>, S-<right>, S-<up>, S-<down> to switch windows
(require 'windmove)

; User defined commands
; If fido-mode is enabled, M-x / and a letter is enough to call user commands

; M-x ivanb/sudo to edit the current file as root
(defun ivanb/sudo ()
  "Use TRAMP to `sudo' the current buffer."
  (interactive)
  (when buffer-file-name
    (find-alternate-file
     (concat "/sudo:root@localhost:" buffer-file-name))))

; Height: menubar+toolbar 38, toolbar 39, without both 41; M-x ivanb/resvert
; Global variables should have prefix: prefix-variable, prefix/variable
(defvar ivanb/resvert 41 "Number of lines in a window.")
(defun ivanb/resvert ()
  "Toggle frame height from normal to vertically maximized and back."
  (interactive)
  (cond ((= (frame-height) (cdr (assq 'height default-frame-alist)))
         (set-frame-height nil ivanb/resvert)
         (set-frame-parameter nil 'top 0))
        (t (set-frame-height nil (cdr (assq 'height default-frame-alist)))
           (set-frame-parameter nil 'top 0))))

(defun ivanb/info ()
  "Set frame shape for reading `info' documents."
  (interactive)
  (modify-frame-parameters nil (list '(top . 0)
                                     '(left . 406)
                                     '(width . 88)
                                     (cons 'height ivanb/resvert))))

(defun ivanb/tsplit ()
  "Toggle between horizontal and vertical split. Require 2 open windows."
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
             (next-win-buffer (window-buffer (next-window)))
             (this-win-edges (window-edges (selected-window)))
             (next-win-edges (window-edges (next-window)))
             (this-win-2nd (null (and (<= (car this-win-edges)
                                         (car next-win-edges))
                                     (<= (cadr this-win-edges)
                                         (cadr next-win-edges)))))
             (splitfunc
              (if (= (car this-win-edges)
                     (car (window-edges (next-window))))
                  'split-window-horizontally
                'split-window-vertically)))
        (delete-other-windows)
        (let ((first-win (selected-window)))
          (funcall splitfunc)
          (and this-win-2nd (other-window 1))
          (set-window-buffer (selected-window) this-win-buffer)
          (set-window-buffer (next-window) next-win-buffer)
          (select-window first-win)
          (and this-win-2nd (other-window 1))))
    (message "Require 2 open windows!")))

(defun ivanb/blines ()
  "Delete all blank lines in current buffer, or narrowed part."
  (interactive)
  (save-excursion
    (let ((fresult (flush-lines "^\\s-*$" (point-min) (point-max))))
      (cond ((zerop fresult) (message "There were no blank lines to delete."))
            ((= fresult 1) (message "Deleted one blank line."))
            (t (message "Deleted %d blank lines." fresult))))))

(defun ivanb/dword ()
  "Search forward for a duplicated word."
  (interactive)
  (message "Searching for duplicated words ...")
  (push-mark)
  (if (re-search-forward "\\b\\([^'@\" \n\t]+\\)[ \n\t]+\\1\\b" nil 'move)
      (message "Found duplicated word.")
    (message "End of buffer")))

(defun ivanb/pcontents (lst)
  "Display contents of LST in *Messages* buffer."
  (interactive "SList variable: ")
  (and (get-buffer "*Messages*") (kill-buffer "*Messages*"))
  (message "Contents of `%s':" (or (and (called-interactively-p 'any) lst) "variable"))
  (and (called-interactively-p 'any) (setq lst (eval lst)))
  (cond ((listp lst)
         (while lst (message "%s" (car lst)) (setq lst (cdr lst)))
         (switch-to-buffer "*Messages*") nil)
        (t (message "Variable is not a list!"))))

; Customize fonts and colors (Font Lock categories):
; C-[ : (customize-face)
; Fido mode (advanced completion mode, part of icomplete-mode)
; M-x customize-mode      icomplete-mode
; M-x customize-variable  mode-line-position-column-format
; M-x customize-variable  mode-line-position-column-line-format
; M-x customize-option    global-display-line-numbers-mode
; M-x customize-group     display-line-numbers
; M-x customize-group     backup
; M-x customize-option    sentence-end-double-space
; M-x customize-option    indent-tabs-mode
; M-x customize-option    tab-width
; M-x customize-mode      python-mode
; M-x customize-mode      tcl-mode
; In alist (name . nil) is just (name), nil is off, value is on
; (menu-bar-lines . 1) means on, (menu-bar-lines) means off
; (tool-bar-lines . 1) means on, (tool-bar-lines) means off
; M-x menu-bar-mode       toggles menu bar interactively
; M-x tool-bar-mode       toggles tool bar interactively
; custom-safe-themes contains a list, each element should be either
; the SHA-256 hash of a safe theme file, or the symbol default
; sha256sum ivanb-theme.el
; List of programming style names stored in file
; /usr/share/emacs/28.2/lisp/progmodes/cc-styles.el.gz
; Built-in variables can be added to custom-set-variables manually,
; even if they cannot be customized through GUI, example:
; disabled-command-function - turns off prompt about disabled functions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(backup-by-copying t)
 `(backup-directory-alist
    '(,(cons ".*" (concat user-emacs-directory "backupdir/"))))
 '(blink-cursor-mode nil)
 '(c-basic-offset 'set-from-style)
 '(c-default-style
    '((c-mode . "gnu")
      (c++-mode . "gnu")
      (objc-mode . "gnu")
      (java-mode . "gnu")
      (idl-mode . "gnu")
      (pike-mode . "gnu")
      (awk-mode . "gnu")
      (other . "gnu")))
 '(column-number-mode t)
 '(css-indent-offset 2)
 '(custom-safe-themes
    '("c8bc4fe5f15bef1916df42a2648997e33d5b3ae4539c241bbef19c54c9aa3a42"
      "957ca2f5a95f9d2596f51da41f5bea0661c1aa225f2a5e18929014788ba540c3"
      "1a4dd54beebdd6daef69bf2f45ff26ceaf28192e2f2e50612de792d9872a7519"
      default))
 '(default-frame-alist
    '((background-mode . light)
      (background-color . "#ffffff")
      (foreground-color . "#000000")
      (cursor-color . "#000000")
      (cursor-type . box)
      (width . 88)
      (height . 31)
      (menu-bar-lines)
      (tool-bar-lines)
      (vertical-scroll-bars)
      (horizontal-scroll-bars)))
 '(disabled-command-function nil)
 '(display-line-numbers 'visual)
 '(display-line-numbers-grow-only t)
 '(display-line-numbers-type 'visual)
 '(display-line-numbers-width-start t)
 '(fido-mode t)
 '(file-precious-flag t)
 '(fill-column 80)
 '(global-display-line-numbers-mode t)
 '(indent-tabs-mode nil)
 `(inhibit-startup-echo-area-message ,(user-login-name))
 '(inhibit-startup-screen t)
 '(initial-scratch-message nil)
 '(isearch-allow-motion t)
 '(js-indent-level 2)
 '(line-number-mode t)
 '(lisp-body-indent 2)
 '(lisp-indent-offset nil)
 '(lisp-lambda-list-keyword-parameter-indentation 2)
 `(max-lisp-eval-depth ,(or (and (>= max-lisp-eval-depth 8192) max-lisp-eval-depth) 8192))
 `(max-specpdl-size ,(or (and (>= max-specpdl-size 8192) max-specpdl-size) 8192))
 '(mhtml-tag-relative-indent 'ignore)
 '(mode-line-position-column-format '(" C%C"))
 '(mode-line-position-column-line-format '(" (%l,%C)"))
 '(perl-indent-level 2)
 '(python-indent-offset 4)
 '(ring-bell-function 'ignore)
 '(ruby-indent-level 2)
 '(rust-indent-offset 2)
 '(sentence-end-double-space nil)
 '(sgml-attribute-offset 0)
 '(sgml-basic-offset 2)
 '(sh-basic-offset 2)
 '(standard-indent 2)
 '(tab-always-indent t)
 '(tab-width 2)
 '(tcl-continued-indent-level 0)
 '(tcl-indent-level 2)
 '(tcl-tab-always-indent t)
 '(view-highlight-face 'lazy-highlight)
 '(view-read-only t)
 '(windmove-default-keybindings '([ignore] shift))
 '(windmove-wrap-around t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

; Custom key bindings
; C-c key prefix is reserved for major and minor modes!
; 'compare-windows can be bound to a key if used frequently enough

; Remap C-x C-c to prevent quitting Emacs by fatfingering xc
(global-unset-key (kbd "C-x C-c"))
(global-set-key (kbd "C-x C-M-c") 'save-buffers-kill-terminal)
; Remap C-x C-b to call 'ibuffer instead of 'list-buffers, or 'buffer-menu
(global-set-key (kbd "C-x C-b") 'ibuffer)
; Remap M-i to call 'imenu (default is 'tab-to-tab-stop)
(global-set-key (kbd "M-i") 'imenu)
; Map M-o to cycle through all windows
(global-set-key (kbd "M-o") 'other-window)
; C-[ C-z to cut up to character (not including it)
(global-set-key (kbd "C-M-z") 'zap-up-to-char)

; load-theme should be called with t as 2nd arg, or
; after variable custom-safe-themes has been loaded
(if (file-exists-p (concat user-emacs-directory "ivanb-theme.el"))
    (load-theme 'ivanb))

; Uncomment one of next lines to enable menu bar and/or tool bar
; (progn (menu-bar-mode) (tool-bar-mode) (setq ivanb/resvert 38))
; (progn (tool-bar-mode) (setq ivanb/resvert 39))

