(deftheme ivanb
  "Light colorscheme")

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

(mapc #'disable-theme custom-enabled-themes)

(custom-theme-set-faces
'ivanb
'(default ((t (:family "Liberation Mono"
               :foundry "1ASC"
               :width normal
               :height 158
               :weight normal
               :slant normal
               :underline nil
               :overline nil
               :extend nil
               :strike-through nil
               :box nil
               :inverse-video nil
               :foreground "#000000"
               :background "#ffffff"
               :stipple nil
               :inherit nil))))
'(cursor ((t (:background "#000000"))))
'(fixed-pitch ((t (:family "Liberation Mono"))))
'(variable-pitch ((t (:family "Liberation Sans"))))
'(escape-glyph ((t (:foreground "#d75f00"))))
'(nobreak-space ((t (:inherit (escape-glyph) :underline t))))
'(nobreak-hyphen ((t (:foreground "#af0000"))))
'(homoglyph ((t (:foreground "#d75f00"))))
'(minibuffer-prompt ((t (:foreground "#0000af"))))
'(highlight ((t (:background "#eeeeee"))))
'(region ((t (:extend t :background "#d0d0d0" :distant-foreground "#d0d0d0"))))
'(shadow ((t (:foreground "#757575"))))
'(secondary-selection ((t (:extend t :background "#b4eeb4"))))
'(trailing-whitespace ((t (:background "#af0000"))))
'(warning ((t (:foreground "#d75f00" :weight bold))))
'(error ((t (:foreground "#af0000" :weight bold))))
'(font-lock-warning-face ((t (:inherit (error)))))
'(font-lock-builtin-face ((t (:foreground "#af0000" :weight bold))))
'(font-lock-comment-delimiter-face ((default (:inherit (font-lock-comment-face)))))
'(font-lock-comment-face ((t (:foreground "#008700"))))
'(font-lock-constant-face ((t (:foreground "#d75f00"))))
'(font-lock-doc-face ((t (:inherit (font-lock-string-face)))))
'(font-lock-doc-markup-face ((t (:inherit (font-lock-constant-face)))))
'(font-lock-function-name-face ((t (:foreground "#005f00" :weight bold))))
'(font-lock-keyword-face ((t (:foreground "#870087" :weight bold))))
'(font-lock-negation-char-face ((t (:foreground "#af0000"))))
'(font-lock-preprocessor-face ((t (:inherit (font-lock-builtin-face)))))
'(font-lock-regexp-grouping-backslash ((t (:inherit (bold)))))
'(font-lock-regexp-grouping-construct ((t (:inherit (bold)))))
'(font-lock-string-face ((t (:foreground "#0000af"))))
'(font-lock-type-face ((t (:foreground "#870087"))))
'(font-lock-variable-name-face ((t (:foreground "#000000"))))
'(elisp-shorthand-font-lock-face ((t (:inherit (font-lock-keyword-face) :foreground "#008787"))))
'(sh-quoted-exec ((t (:foreground "#005f00"))))
'(sh-heredoc ((t (:foreground "#0000af"))))
'(yaml-tab-face ((t (:background "#af0000" :foreground "#af0000" :weight bold))))
'(show-paren-match ((t (:background "#ffff87"))))
'(show-paren-mismatch ((t (:background "#af0000" :foreground "#ffffff"))))
'(link ((t (:underline (:color foreground-color :style line) :foreground "#008787"))))
'(link-visited ((default (:inherit (link))) (t (:foreground "#870087"))))
'(button ((t (:inherit (link)))))
'(fringe ((t (:background "#f2f2f2"))))
'(header-line
((default (:inherit (mode-line)))
(((type tty)) (:underline (:color foreground-color :style line) :inverse-video nil))
(((class color grayscale)) (:box nil :foreground "#333333" :background "#e5e5e5"))
(((class mono)) (:underline (:color foreground-color :style line) :box nil :inverse-video nil :foreground "#000000" :background "#ffffff"))))
'(tooltip ((t (:inherit (variable-pitch) :foreground "#000000" :background "#ffff87"))))
'(mode-line ((t (:foreground "#000000" :background "#d4d4d4" :box (:line-width (1 . -1) :color nil :style released-button)))))
'(mode-line-buffer-id ((t (:weight bold))))
'(mode-line-emphasis ((t (:weight bold))))
'(mode-line-highlight ((t (:box (:line-width (2 . 2) :color "#666666" :style released-button)))))
'(mode-line-inactive
((t (:inherit (mode-line) :background "#e5e5e5" :foreground "#333333" :box (:line-width (1 . -1) :color "#bfbfbf") :weight light))))
'(line-number ((t (:inherit (shadow default)))))
'(line-number-current-line ((t (:inherit (line-number) :foreground "#008700"))))
'(isearch ((t (:background "#005f00" :foreground "#ffffff"))))
'(isearch-fail ((t (:background "#ffc1c1"))))
'(isearch-group-1 ((t (:background "#a000a0" :foreground "#b4eeb4"))))
'(isearch-group-2 ((t (:background "#870087" :foreground "#b0e2ff"))))
'(lazy-highlight ((t (:background "#ffff55"))))
'(match ((t (:background "#b4eeb4"))))
'(next-error ((t (:inherit (region)))))
'(query-replace ((t (:inherit (isearch)))))
'(whitespace-big-indent ((t (:background "#af0000" :foreground "#d75f00"))))
'(whitespace-line ((t (:background "#333333" :foreground "#eeeeee"))))
'(whitespace-trailing ((t (:background "#af0000" :foreground "#ffff87"))))
'(completions-common-part ((t (:foreground "#0000af"))))
'(custom-invalid ((t (:background "#af0000" :foreground "#ffff87"))))
'(dired-broken-symlink ((t (:background "#af0000" :foreground "#ffff87" :weight bold))))
'(dired-directory ((t (:foreground "#0000af" :weight bold))))
'(dired-flagged ((t (:foreground "#af0000" :weight bold))))
'(dired-marked ((t (:foreground "#d75f00" :weight bold))))
'(custom-group-tag-1 ((t (:inherit (variable-pitch) :foreground "#af0000" :weight bold :height 1.2))))
'(info-menu-star ((t (:foreground "#008700"))))
'(shr-selected-link ((t (:inherit (shr-link) :background "#b4eeb4"))))
'(sldb-restartable-frame-line-face ((t (:foreground "#008700"))))
'(success ((t (:foreground "#008700" :weight bold))))
'(widget-button-pressed ((t (:foreground "#af0000"))))
'(widget-documentation ((t (:foreground "#005f00"))))
'(diary ((t (:foreground "#af0000"))))
'(epa-mark ((t (:foreground "#af0000" :weight bold))))
'(eww-invalid-certificate ((t (:foreground "#af0000" :weight bold))))
'(eww-valid-certificate ((t (:foreground "#008700" :weight bold))))
'(gnus-summary-cancelled ((t (:extend t :background "#000000" :foreground "#ffff55"))))
'(markdown-highlighting-face ((t (:background "#ffff55" :foreground "#000000"))))
'(message-cited-text-1 ((t (:foreground "#870087"))))
'(outline-1 ((t (:foreground "#870087" :weight bold))))
'(outline-2 ((t (:foreground "#af0000" :weight bold))))
'(outline-3 ((t (:foreground "#005f00" :weight bold))))
'(outline-4 ((t (:foreground "#0000af" :weight bold))))
'(outline-5 ((t (:foreground "#008700" :weight bold))))
'(outline-6 ((t (:foreground "#d75f00" :weight bold))))
'(outline-7 ((t (:foreground "#008787" :weight bold))))
'(outline-8 ((t (:foreground "#000000" :weight bold))))
'(org-agenda-structure ((t (:foreground "#0000af"))))
'(org-todo ((t (:foreground "#af0000" :weight bold))))
'(org-date-selected ((t (:foreground "#af0000" :inverse-video t))))
'(org-date ((t (:foreground "#870087" :underline t))))
'(org-drawer ((t (:foreground "#0000af"))))
'(org-done ((t (:foreground "#008700" :weight bold))))
'(org-footnote ((t (:foreground "#870087" :underline t))))
'(org-mode-line-clock-overrun ((t (:inherit (mode-line) :background "#af0000" :foreground "#ffffff"))))
'(org-sexp-date ((t (:foreground "#870087"))))
'(org-table ((t (:foreground "#0000af"))))
'(vc-state-base ((t (:foreground "#000000"))))
'(vc-up-to-date-state ((t (:inherit (vc-state-base) :foreground "#005f00"))))
'(vc-edited-state ((t (:inherit (vc-state-base) :foreground "#0000af"))))
'(vc-locally-added-state ((t (:inherit (vc-state-base) :foreground "#008700"))))
'(vc-needs-update-state ((t (:inherit (vc-state-base) :foreground "#870087"))))
'(vc-removed-state ((t (:inherit (vc-state-base) :foreground "#008787"))))
'(vc-locked-state ((t (:inherit (vc-state-base) :foreground "#d75f00"))))
'(vc-conflict-state ((t (:inherit (vc-state-base) :foreground "#af0000"))))
'(vc-missing-state ((t (:inherit (vc-state-base) :foreground "#af0000"))))
'(speedbar-button-face ((t (:foreground "#008700"))))
'(speedbar-directory-face ((t (:foreground "#0000af" :weight bold))))
'(speedbar-file-face ((t (:foreground "#000000"))))
'(speedbar-highlight-face ((t (:background "#b4eeb4"))))
'(speedbar-selected-face ((t (:foreground "#af0000" :underline t))))
'(speedbar-separator-face ((t (:background "#0000af" :foreground "#eeeeee" :overline "#bebebe"))))
'(speedbar-tag-face ((t (:foreground "#d75f00")))))

(message "Loading ivanb (theme)...done")

(provide-theme 'ivanb)
