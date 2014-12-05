;;(require 'bundler)

(defun my-ruby-mode-hook ()
  (projectile-mode)
  (robe-mode)
  (ruby-refactor-mode-launch)
  (smartparens-mode)
  (stag-code-modes-hook)
  (auto-complete-mode)
  (inf-ruby-minor-mode)
  (rvm-activate-corresponding-ruby)
  (rspec-mode))

(add-hook 'enh-ruby-mode-hook 'my-ruby-mode-hook)
(add-hook 'enh-ruby-mode-hook 'stag-code-modes-hook)
(add-hook 'projectile-mode-hook 'projectile-rails-on)
(add-to-list 'auto-mode-alist '("Guardfile" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '(".pryrc" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("config.ru" . enh-ruby-mode))

(require 'inf-ruby)
(add-to-list 'inf-ruby-implementations '("pry" . "pry"))
(setq inf-ruby-default-implementation "pry")
(setq inf-ruby-first-prompt-pattern "^\\[[0-9]+\\] pry\\((.*)\\)> *")
(setq inf-ruby-prompt-pattern "^\\[[0-9]+\\] pry\\((.*)\\)[>*\"'] *")
