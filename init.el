; (package-initialize)

(setq package-enable-at-startup nil)
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ;; ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")
                         ("gnu" . "https://elpa.gnu.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")))
(package-initialize)

(setq package-archive-priorities
      '(("melpa-stable" . 10000)))

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

;; staight.el is an alternative to package.el
(setq straight-base-dir "~/.emacs.d/local-files/")
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" "~/.emacs.d/local-files/"))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; ;; This lets use-package install packages that come built-in with emacs, like org-mode
(defun package-from-archive (f &rest args)
  (and (apply f args)
       (assq (car args) package-alist)))

(setq use-package-always-pin "melpa-stable")
(setq use-package-always-ensure t)

(org-babel-load-file "~/.emacs.d/aldric.org")
(put 'dired-find-alternate-file 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
