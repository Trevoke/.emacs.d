;; Don't show me the splash screen
(setq inhibit-splash-screen t)

(setq initial-scratch-message nil)

(tool-bar-mode -1)

(show-paren-mode t)
(setq show-paren-delay 0)

;; cursor moves down from real line to real line
(setq line-move-visual nil)

;; Isn't bash supposed to be emacs-like or something?
(global-set-key (kbd "C-w") 'backward-kill-word)
(global-set-key (kbd "C-x C-k") 'kill-region)

;; highlight current line
(global-hl-line-mode t)

;; tell me on what column the cursor is
(setq column-number-mode t)

;; use ibuffer instead of default buffer
(global-set-key (kbd "C-x C-b") 'ibuffer-other-window)
(setq ibuffer-default-sorting-mode 'major-mode)

;; make buffer names unique
(setq
  uniquify-buffer-name-style 'post-forward
  uniquify-separator ":")

(setq-default dired-listing-switches "-alhv")

(setq ring-bell-function 'ignore)

;; only type y or n when asked a question
(fset 'yes-or-no-p 'y-or-n-p)

(setq calendar-week-start-day 1) ;; Monday

(setq sentence-end-double-space nil) ;; Just one space after a period.


;;* UTF-8 and codings

;; Activate UTF-8 mode:
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; 2013-12-10 IRC #Emacs
(set-clipboard-coding-system 'utf-8)

;; http://www.masteringemacs.org/articles/2012/08/09/working-coding-systems-unicode-emacs/
;; in addition to the lines above:

(set-default-coding-systems 'utf-8)
;; backwards compatibility as default-buffer-file-coding-system
;; is deprecated in 23.2.
(if (boundp 'buffer-file-coding-system)
    (setq-default buffer-file-coding-system 'utf-8)
  (setq default-buffer-file-coding-system 'utf-8))
;; Treat clipboard input as UTF-8 string first; compound text next, etc.
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))

;;* END UTF-8 and codings
