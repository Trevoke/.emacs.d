                                        ;(package-initialize)

(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")
                         ("gnu" . "https://elpa.gnu.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")))
(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)


;; ;; This lets use-package install packages that come built-in with emacs, like org-mode
(defun package-from-archive (f &rest args)
  (and (apply f args)
       (assq (car args) package-alist)))

(advice-add 'package-installed-p :around 'package-from-archive)

(setq use-package-always-pin "melpa-stable")
(setq use-package-always-ensure t)
;; (setq use-package-always-defer t)

;; (add-to-list 'load-path "~/.emacs.d/packages/org/lisp")
;; (add-to-list 'load-path "~/.emacs.d/packages/org/contrib/lisp" t)
;; (require 'org)
;;
(use-package org :pin "org")

(advice-remove 'package-installed-p 'package-from-archive)

(org-babel-load-file "~/.emacs.d/aldric.org")
(put 'dired-find-alternate-file 'disabled nil)
