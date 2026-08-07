;;; modus-jellybeans.el --- Jellybeans colours on top of Modus themes -*- lexical-binding: t -*-

;; Copyright (C) 2026 Free Software Foundation, Inc.
;; Author: Aldric Giacomoni <trevoke@gmail.com>
;; Maintainer: Aldric Giacomoni <trevoke@gmail.com>
;; URL: https://github.com/Trevoke/modus-jellybeans
;; Version: 0.1.0
;; Based on: https://github.com/nanotech/jellybeans.vim
;; Package-Requires: ((emacs "28.1") (modus-themes "5.0.0"))
;; Keywords: faces, theme, accessibility

;; This file is NOT part of GNU Emacs.

;; GNU Emacs is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:
;;
;; The `modus-jellybeans' themes are a collection of themes for GNU Emacs
;; built on top of the `modus-themes' infrastructure.
;;
;; `modus-jellybeans-dark' is a faithful port of NanoTech's jellybeans.vim.
;; Colour values are taken directly from the Vim colour file.
;;
;; `modus-jellybeans-light' is NOT a port -- upstream jellybeans has never
;; had a light variant.  It is an original light scheme that preserves the
;; hue relationships of the dark theme while re-deriving every luminance
;; for a light background.  See the README for the method.
;;
;; Naming note: jellybeans has no notion of many Emacs concepts (docstrings,
;; regexp groups, headings).  Where a mapping below has no Vim counterpart,
;; the comment says so and explains the choice.

;;; Code:

(require 'modus-themes)
(eval-when-compile (require 'subr-x))

;;;; Basics for building on top of Modus

(defgroup modus-jellybeans ()
  "Jellybeans colour palette on top of the Modus themes infrastructure."
  :group 'faces
  :group 'modus-themes
  :link '(info-link "(modus-themes) Top")
  :prefix "modus-jellybeans"
  :tag "Modus Jellybeans Themes")

(defconst modus-jellybeans-light-themes
  '(modus-jellybeans-light)
  "List of symbols with the light Modus Jellybeans themes.")

(defconst modus-jellybeans-dark-themes
  '(modus-jellybeans-dark)
  "List of symbols with the dark Modus Jellybeans themes.")

(defvaralias 'modus-jellybeans-collection 'modus-jellybeans-items
  "Alias of `modus-jellybeans-items'.")

(defconst modus-jellybeans-items
  (append modus-jellybeans-light-themes modus-jellybeans-dark-themes))

(defconst modus-jellybeans-common-palette-mappings
  '(
    ;; ---------------------------------------------------------------
    ;; Syntax.
    ;;
    ;; jellybeans is a RICH syntax theme, like Modus itself.  So unlike
    ;; some Modus derivatives, we do not flatten anything to `fg-main';
    ;; we re-point Modus's semantic slots at the jellybeans hues.
    ;;
    ;; Each `jellybeans-*' name below is defined per-theme, so light and
    ;; dark share these mappings but supply different values.
    ;; ---------------------------------------------------------------

    ;; Vim `Comment' (italic; `modus-themes-italic-constructs' controls
    ;; whether the slant is applied).
    (comment      jellybeans-comment)

    ;; Vim `String'.  jellybeans has no docstring concept -- Emacs's own
    ;; default has `font-lock-doc-face' inherit from the string face, on
    ;; the logic that elisp docstrings ARE string literals.  We follow
    ;; Emacs here rather than Vim, which would render docstrings
    ;; identically to comments.
    (string       jellybeans-string)
    (docstring    jellybeans-string)

    ;; Vim `Special' (#799d6a in the dark theme).  Vim's `SpecialComment'
    ;; links to `Special', and that is what highlights javadoc/rdoc
    ;; markup tokens such as @param and @return.  So this IS the faithful
    ;; jellybeans colour for doc markup.
    (docmarkup    jellybeans-special)

    ;; Vim `Constant'.  Vim groups Number/Boolean/Float under Constant.
    (constant     jellybeans-constant)
    (number       jellybeans-constant)

    ;; Vim `Statement' -- the signature soft jellybeans blue.
    (keyword      jellybeans-statement)

    ;; Vim has no generic "builtin" group, but it has
    ;; `rubyPredefinedIdentifier', and `erlangBIF' (literally "Built-In
    ;; Function") links straight to it.  So this is jellybeans' actual
    ;; builtin-identifier colour rather than a guess.
    (builtin      jellybeans-predefined)

    ;; Vim `Function'.
    (fnname       jellybeans-function)
    (fnname-call  jellybeans-function)

    ;; Vim `Type'.
    (type         jellybeans-type)

    ;; Vim `Identifier'.
    (variable     jellybeans-identifier)
    (variable-use jellybeans-identifier)
    (property     jellybeans-identifier)

    ;; Vim `PreProc' and `Structure' share a value in jellybeans, and
    ;; jellybeans explicitly does `hi! link Operator Structure' -- so
    ;; mapping the operator to the same hue is faithful, not incidental.
    (preprocessor jellybeans-structure)
    (operator     jellybeans-structure)

    ;; Vim `Delimiter'.
    (bracket      jellybeans-delimiter)
    (delimiter    jellybeans-delimiter)
    (punctuation  jellybeans-delimiter)

    ;; Vim `rubyRegexp' / `rubyRegexpSpecial'.  jellybeans' own
    ;; regexp-delimiter colour (#540063) is far too dark to use as a
    ;; foreground, so the brighter regexp colour is used for both.
    (rx-construct jellybeans-regexp)
    (rx-backslash jellybeans-special)

    ;; ---------------------------------------------------------------
    ;; Links.  Vim has no link concept; blue reads as a link by
    ;; convention, and visited links take the identifier purple.
    ;; ---------------------------------------------------------------
    (fg-link                 jellybeans-structure)
    (underline-link          jellybeans-structure)
    (fg-link-symbolic        jellybeans-special)
    (underline-link-symbolic jellybeans-special)
    (fg-link-visited         jellybeans-identifier)
    (underline-link-visited  jellybeans-identifier)

    ;; ---------------------------------------------------------------
    ;; Search.  Vim `Search' is fg #f0a0c0 on bg #302028, underlined.
    ;; ---------------------------------------------------------------
    (fg-search-current    jellybeans-search-fg)
    (fg-search-lazy       jellybeans-search-fg)
    (fg-search-static     jellybeans-search-fg)
    (fg-search-replace    jellybeans-search-fg)
    (fg-search-rx-group-0 jellybeans-search-fg)
    (fg-search-rx-group-1 jellybeans-search-fg)
    (fg-search-rx-group-2 jellybeans-search-fg)
    (fg-search-rx-group-3 jellybeans-search-fg)

    ;; ---------------------------------------------------------------
    ;; Diagnostics.  Vim's `ErrorMsg' is light text ON a #902020 block,
    ;; so it gives no foreground error colour; the rubyPredefined red is
    ;; the most legible jellybeans red for foreground use.
    ;; ---------------------------------------------------------------
    (err               jellybeans-predefined)
    (warning           jellybeans-type)
    (info              jellybeans-structure)
    (underline-err     jellybeans-predefined)
    (underline-warning jellybeans-type)
    (underline-note    jellybeans-structure)

    ;; ---------------------------------------------------------------
    ;; Accents, completion, prompts.
    ;; ---------------------------------------------------------------
    (accent-0              jellybeans-structure)
    (accent-1              jellybeans-function)
    (accent-2              jellybeans-string)
    (accent-3              jellybeans-identifier)
    (fg-completion-match-0 jellybeans-structure)
    (fg-completion-match-1 jellybeans-function)
    (fg-completion-match-2 jellybeans-string)
    (fg-completion-match-3 jellybeans-identifier)
    (fg-prompt             jellybeans-search-fg)
    (keybind               jellybeans-search-fg)
    (name                  jellybeans-function)
    (identifier            jellybeans-identifier)

    ;; ---------------------------------------------------------------
    ;; Prose and headings.  Vim `Title' is the bold green used for the
    ;; top heading; the rest cycle through the jellybeans accents.
    ;; ---------------------------------------------------------------
    (fg-prose-code        jellybeans-string)
    (fg-prose-macro       jellybeans-special)
    (fg-prose-verbatim    jellybeans-type)
    (prose-done           jellybeans-question)
    (prose-todo           jellybeans-constant)
    (prose-tag            jellybeans-function)
    (prose-table          jellybeans-delimiter)
    (prose-metadata       jellybeans-comment)
    (prose-metadata-value jellybeans-delimiter)
    (fg-heading-0 jellybeans-title)
    (fg-heading-1 jellybeans-title)
    (fg-heading-2 jellybeans-function)
    (fg-heading-3 jellybeans-structure)
    (fg-heading-4 jellybeans-identifier)
    (fg-heading-5 jellybeans-string)
    (fg-heading-6 jellybeans-type)
    (fg-heading-7 jellybeans-special)
    (fg-heading-8 jellybeans-delimiter)

    ;; ---------------------------------------------------------------
    ;; Dates.
    ;; ---------------------------------------------------------------
    (date-common           jellybeans-structure)
    (date-deadline         jellybeans-predefined)
    (date-deadline-subtle  jellybeans-constant)
    (date-scheduled        jellybeans-type)
    (date-scheduled-subtle jellybeans-storage)
    (date-holiday          jellybeans-search-fg)
    (date-holiday-other    jellybeans-statement)
    (date-weekday          jellybeans-structure)
    (date-weekend          jellybeans-identifier)
    (date-event            jellybeans-delimiter)
    (date-now              jellybeans-question)
    (date-range            jellybeans-delimiter)

    ;; ---------------------------------------------------------------
    ;; Mail.
    ;; ---------------------------------------------------------------
    (mail-cite-0    jellybeans-structure)
    (mail-cite-1    jellybeans-function)
    (mail-cite-2    jellybeans-string)
    (mail-cite-3    jellybeans-identifier)
    (mail-part      jellybeans-statement)
    (mail-recipient jellybeans-function)
    (mail-subject   jellybeans-title)
    (mail-other     jellybeans-delimiter)

    ;; ---------------------------------------------------------------
    ;; Rainbow (rainbow-delimiters and friends), drawn from the
    ;; jellybeans accents in rough order of prominence.
    ;; ---------------------------------------------------------------
    (rainbow-0 jellybeans-normal)
    (rainbow-1 jellybeans-function)
    (rainbow-2 jellybeans-structure)
    (rainbow-3 jellybeans-string)
    (rainbow-4 jellybeans-identifier)
    (rainbow-5 jellybeans-constant)
    (rainbow-6 jellybeans-statement)
    (rainbow-7 jellybeans-type)
    (rainbow-8 jellybeans-special))
  "Common palette mappings for the Modus Jellybeans themes.
Each `jellybeans-*' symbol is defined in the individual theme
palettes, so the light and dark variants share these semantics while
supplying their own values.")

(defcustom modus-jellybeans-common-palette-overrides nil
  "Palette overrides shared by all Modus Jellybeans themes.
Use this for semantic mappings that should apply to both light and
dark variants.  Per-theme overrides are preferred for colour values,
as those will differ between light and dark.

See `modus-themes-common-palette-overrides' for the format."
  :group 'modus-jellybeans
  :type '(repeat (list symbol (choice symbol string))))

(defconst modus-jellybeans-with-properties
  '((modus-jellybeans-light modus-jellybeans "Jellybeans-inspired light palette on modus-operandi." light modus-themes-operandi-palette modus-jellybeans-light-palette modus-jellybeans-light-palette-overrides)
    (modus-jellybeans-dark modus-jellybeans "Jellybeans dark palette on modus-vivendi." dark modus-themes-vivendi-palette modus-jellybeans-dark-palette modus-jellybeans-dark-palette-overrides))
  "Properties for each Modus Jellybeans theme.
Each entry is a list of arguments passed to `modus-themes-declare'
and `modus-themes-register'.")

(defvar modus-jellybeans--declared-p nil
  "Non-nil if Modus Jellybeans themes have been declared.")

(defun modus-jellybeans-declare-themes ()
  "Declare and register the Modus Jellybeans themes with modus-themes."
  (unless modus-jellybeans--declared-p
    (dolist (theme modus-jellybeans-with-properties)
      (apply #'modus-themes-declare theme)
      (modus-themes-register (car theme)))
    (setq modus-jellybeans--declared-p t)))

(modus-jellybeans-declare-themes)

;;;; Limit the Modus themes to only Modus Jellybeans themes

;;;###autoload
(define-minor-mode modus-jellybeans-take-over-modus-themes-mode
  "When enabled, all Modus theme commands consider only Modus Jellybeans themes.
Alternatively, use the dedicated commands `modus-jellybeans-rotate',
`modus-jellybeans-select', `modus-jellybeans-load-random',
`modus-jellybeans-load-random-dark',
`modus-jellybeans-load-random-light',
`modus-jellybeans-list-colors',
`modus-jellybeans-list-colors-current'.
They are all designed to only consider Modus Jellybeans themes."
  :global t
  :init-value nil)

(cl-defmethod modus-themes-get-themes (&context (modus-jellybeans-take-over-modus-themes-mode (eql t)))
  "Return the Modus Jellybeans themes.
Do so per `modus-jellybeans-take-over-modus-themes-mode'."
  (if-let* ((themes (modus-themes-get-all-known-themes 'modus-jellybeans))
            (sorted-a-z (sort themes #'string-lessp))
            (sorted-light-dark (modus-themes-sort sorted-a-z 'light)))
      sorted-light-dark
    modus-jellybeans-items))

;;;; Convenience commands

;;;###autoload (autoload 'modus-jellybeans-rotate "modus-jellybeans")
(modus-themes-define-derivative-command modus-jellybeans rotate)

;;;###autoload (autoload 'modus-jellybeans-select "modus-jellybeans")
(modus-themes-define-derivative-command modus-jellybeans select)

;;;###autoload (autoload 'modus-jellybeans-load-random "modus-jellybeans")
(modus-themes-define-derivative-command modus-jellybeans load-random)

;;;###autoload (autoload 'modus-jellybeans-load-random-dark "modus-jellybeans")
(modus-themes-define-derivative-command modus-jellybeans load-random-dark)

;;;###autoload (autoload 'modus-jellybeans-load-random-light "modus-jellybeans")
(modus-themes-define-derivative-command modus-jellybeans load-random-light)

;;;###autoload (autoload 'modus-jellybeans-list-colors "modus-jellybeans")
(modus-themes-define-derivative-command modus-jellybeans list-colors)

;;;###autoload (autoload 'modus-jellybeans-list-colors-current "modus-jellybeans")
(modus-themes-define-derivative-command modus-jellybeans list-colors-current)

;;;; Add themes from the package to the load path

;;;###autoload
(when load-file-name
  (let ((dir (file-name-directory load-file-name)))
    (unless (file-equal-p dir (expand-file-name "themes/" data-directory))
      (add-to-list 'custom-theme-load-path dir))))

(provide 'modus-jellybeans)
;;; modus-jellybeans.el ends here
