(setq package-enable-at-startup nil)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ;; ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(setq package-archive-priorities
      '(("melpa-stable" . 10000)))
(require 'package)
(package-initialize)

(unless (package-installed-p 'quelpa)
  (with-temp-buffer
    (url-insert-file-contents "https://raw.githubusercontent.com/quelpa/quelpa/master/quelpa.el")
    (eval-buffer)
    (quelpa-self-upgrade)))

(quelpa 'use-package)

(quelpa
 '(quelpa-use-package
   :fetcher git
   :url "https://github.com/quelpa/quelpa-use-package.git"))
(require 'quelpa-use-package)
                                        ;(require 'use-package)

(use-package use-package-ensure-system-package :ensure t :demand t)
(setq use-package-always-pin "melpa-stable")
(setq use-package-always-ensure t)

;;  have to do this because org comes preinstalled with emacs
(assq-delete-all 'org package--builtins)
(assq-delete-all 'org package--builtin-versions)

(use-package org
             :pin elpa
             :demand t
             :ensure t
             :init
             (setq org-directory "~/my-life/orgnotes/")
             (setq org-id-track-globally t)
             (setq org-generic-id-locations-file
                   "~/.emacs.d/local-files/org-generic-id-locations")
             (setq org-id-locations-file
                   "~/.emacs.d/local-files/org-id-locations"))
(require 'org)

(org-babel-load-file "~/.emacs.d/aldric.org")

(put 'dired-find-alternate-file 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
