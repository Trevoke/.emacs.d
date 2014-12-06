(defun what-face (pos)
  (interactive "d")
  (let ((face (or (get-char-property pos 'read-face-name)
		  (get-char-property pos 'face))))
    (if face (message "Face: %s" face) (message "No face at %d" pos))))

(defun stag-code-modes-hook ()
  (linum-mode t)
  (add-hook 'before-save-hook 'whitespace-cleanup)
  (ctags-auto-update-mode)
  (local-set-key "\C-m" 'newline-and-indent))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Custom splitting functions ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun vsplit-last-buffer ()
  (interactive)
  (split-window-vertically)
  (other-window 1 nil)
  (switch-to-next-buffer))

(defun hsplit-last-buffer ()
  (interactive)
  (split-window-horizontally)
  (other-window 1 nil)
  (switch-to-next-buffer))

(global-set-key (kbd "C-x 2") 'vsplit-last-buffer)
(global-set-key (kbd "C-x 3") 'hsplit-last-buffer)

(defun stag-insert-line-below ()
  "Insert and auto-indent line below cursor, like in vim."
  (interactive)
  (open-line 1)
  (next-line)
  (indent-for-tab-command))

(defun stag-insert-line-above ()
  "Insert and auto-indent line above cursor, like in vim."
  (interactive)
  (previous-line)
  (move-end-of-line 1)
  (stag-insert-line-below))

(global-set-key (kbd "C-o") 'stag-insert-line-below)
(global-set-key (kbd "C-M-o") 'stag-insert-line-above)
