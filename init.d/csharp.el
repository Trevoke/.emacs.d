(defun stag-csharp-mode-hook ()
  (setq c-basic-offset 4))

(add-hook 'csharp-mode-hook 'stag-code-modes-hook)
(add-hook 'csharp-mode-hook 'stag-csharp-mode-hook)
