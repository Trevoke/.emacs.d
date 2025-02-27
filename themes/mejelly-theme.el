(deftheme mejelly
  "Emacs theme inspired by the vim jellybeans theme.")

(let* ((class '((class color) (min-colors 89)))
       ;; Palette          ; vim things
       (bg       "#151515") ; cursor fg
       (text-fg  "#e8e8d3")
       (black-0  "#000000") ; tabline, status line fg, color column bg, diff text bg
       (blue-0   "#0000df") ; spellcap ; UNUSED
       (black-1  "#101010") ; popup selection fg
       (black-2  "#1b1b1b") ; UNUSED
       (black-3  "#1c1c1c") ; cursor line, cursor column, special key bg, indent guides even
       (black-4  "#1f1f1f") ; fold column bg ; UNUSED
       (black-5  "#232323") ; indent guides odds
       (black-6  "#302028") ; wild menu bg, search bg
       (black-7  "#333333") ; sign column bg
       (black-8  "#384048") ; folded bg ; UNUSED
       (black-9  "#403c41") ; status line nc bg, sign column bg
       (gray-0   "#404040") ; visual bell bg ? ; UNUSED
       (gray-1   "#444444") ; special key fg ; UNUSED
       (gray-2   "#535D66") ; fold column fg ; UNUSED
       (gray-3   "#556779") ; match parens bg
       (gray-4   "#606060") ; popup bg, nontext, line number fg
       (gray-5   "#777777") ; sign column fg ; UNUSED
       (gray-6   "#888888") ; comment (ew! reuse, marginalia?)
       (gray-7   "#9098a0") ; vim tabline fill
       (gray-8   "#b0b8c0") ; tabline bg
       (gray-9   "#a0a8b0") ; folded fg ; UNUSED
       (red-0    "#c6b6ee") ; delimiter, ruby identifier, instance variable
       (white-1  "#ccc5c4") ; cursor line nr
       (white-2  "#c7c7c7") ; todo
       (white-6  "#dddddd") ; status line bg
       (white-7  "#eeeeee") ; popup selection bg
       (white-8  "#f0f0f0") ; vim selected tab bg
       (white-9  "#ffffff") ; match parens fg, popup fg , status line nc
       (blue-9   "#DEEBFE") ; dbg current fg ; UNUSED
       (blue-6   "#8197bf") ; statement ; UNUSED
       (blue-8   "#b0d0f0") ; cursor bg
       (blue-7   "#8fbfdc") ; structure, preproc, diff text fg
       (blue-5   "#7697d6") ; ruby symbol, ruby control ; UNUSED
       (blue-2   "#345FA8") ; dbg current bg ; UNUSED
       (blue-3   "#447799") ; rubyclass
       (blue-4   "#668799") ; delimiter ; UNUSED
       (blue-1   "#2B5B77") ; diffchange bg
       (green-0  "#2D7067") ; spelllocal ; UNUSED
       (green-2  "#437019") ; diff add bg
       (green-3  "#556633") ; string delimiter
       (green-1  "#405026") ; precise jump target bg ; UNUSED
       (green-5  "#70b950") ; title
       (green-6  "#65C254") ; question
       (green-8  "#D2EBBE") ; diff add fg
       (green-7  "#B9ED67") ; precise jump target fg
       (green-4  "#799d6a") ; special
       (yellow-0 "#99ad6a") ; string
       (yellow-5 "#fce094") ; highlight bg
       (yellow-2 "#dad085") ; directory
       (yellow-1 "#c59f6f") ; storageclass
       (yellow-3 "#fad07a") ; function
       (yellow-4 "#ffb964") ; type
       (red-6    "#cf6a4c") ; constant
       (red-7    "#de5577") ; ruby predefined identifier
       (red-1    "#40000A") ; diff delete fg
       (red-2    "#540063") ; spellrare, regexp delimiter
       (red-3    "#700009") ; diff delete bg
       (red-4    "#902020") ; errormsg, spellbad
       (red-9    "#dd0093") ; regexp
       (red-5    "#a40073") ; ruby regexp special
       (red-8    "#f0a0c0") ; wild menu fg, search
       )

  (custom-theme-set-faces
   'mejelly

   `(enh-ruby-regexp-delimiter-face ((,class :foreground ,red-2)))
   `(enh-ruby-regexp-face ((,class :foreground ,red-9)))
   `(enh-ruby-string-delimiter-face ((,class :foreground ,green-3)))

   ;; Basic
   `(default ((,class :foreground ,text-fg :background ,bg)))
   `(shadow ((,class :foreground ,gray-6)))
   `(cursor ((,class :background ,blue-8)))
   `(region ((,class :background ,gray-4 :extend t)))
   `(highlight ((,class :background ,black-3)))
   `(hl-line ((,class :background ,black-3)))
   `(secondary-selection ((,class :background ,gray-3 :extend t)))
   `(hi-yellow ((,class :background ,yellow-5 ,:foreground ,bg)))

   `(success ((,class :foreground ,green-4)))
   `(warning ((,class :foreground ,yellow-2)))
   `(error ((,class :foreground ,red-4)))

   `(fringe ((,class :background ,black-7)))

   `(tab-bar ((,class :background ,white-8 :foreground ,black-0 :box (:line-width 3 :color ,white-8) :inherit (variable-pitch))))
   `(tab-bar-tab-inactive ((,class :background ,gray-8 :box (:line-width 3 :color ,gray-8) :inherit (tab-bar))))
   `(tab-line ((,class :background ,gray-7 :box (:line-width 3 :color ,gray-7))))

   `(tooltip ((,class :background ,black-6 :foreground ,red-8)))

   `(mode-line ((,class :background ,white-6 :foreground ,black-0 :box (:line-width 3 :color ,white-6))))
   ;; `(mode-line-active )
   ;; `(mode-line-buffer-id )
   ;; `(mode-line-emphasis )
   ;; `(mode-line-highlight )
   `(mode-line-inactive ((,class :foreground ,white-9 :background ,black-9 :box (:line-width 3 :color ,black-9))))

   `(minibuffer-prompt ((,class :foreground ,red-8 :weight bold)))

   `(isearch ((,class :foreground ,black-6 :background ,yellow-5)))
   `(lazy-highlight ((,class :foreground ,red-8 :background ,red-1 )))
   `(match ((,class :inherit (isearch))))
   `(isearch-fail ((,class :foreground ,bg :background ,red-8)))
   ;; `(isearch-group-1 )
   ;; `(isearch-group-2 )

   `(show-paren-match ((,class :foreground ,white-9 :background ,gray-3)))
   `(show-paren-mismatch ((,class :foreground ,white-9 :background ,red-4)))

   `(help-argument-name ((,class :inherit (italic) :foreground ,green-4)))
   `(help-key-binding ((,class :inherit (fixed-pitch)
                               :box (:line-width (-1 . -1) :color ,gray-6)
                               :foreground ,red-5
                               :background ,white-6)))

   ;; `(completions-annotations ((,class :inherit (italic shadow)))
   ;; `(marginalia-documentation )

   `(line-number ((,class :foreground ,gray-4)))
   `(line-number-current-line ((,class :foreground ,white-1 :background ,black-3)))

   `(link ((,class :foreground ,blue-7 :underline t)))
   `(link-visited ((,class :foreground ,red-0 :inherit (link))))

   ;; `(icon-button )
   `(font-lock-builtin-face ((,class :foreground ,blue-7 )))
   `(font-lock-comment-face ((,class :foreground ,gray-7)))
   `(font-lock-constant-face ((,class :foreground ,blue-5)))
   `(font-lock-doc-face ((,class :foreground ,green-3)))
   `(font-lock-function-name-face ((,class :foreground ,yellow-3)))
   `(font-lock-keyword-face ((,class :foreground ,blue-5)))
   `(font-lock-warning-face ((,class :foreground ,red-7)))
   ;; `(font-lock-negation-char-face )
   ;; `(font-lock-preprocessor-face )
   ;; `(font-lock-regexp-grouping-backslash )
   ;; `(font-lock-regexp-grouping-construct )
   `(font-lock-string-face ((,class :foreground ,yellow-0)))
   `(font-lock-type-face ((,class :foreground ,yellow-4)))
   `(font-lock-variable-name-face ((,class :foreground ,red-0)))
   ;; `(flycheck-error )
   ;; `(flycheck-fringe-error )
   ;; `(flycheck-fringe-info )
   ;; `(flycheck-fringe-warning )
   ;; `(flycheck-info )
   ;; `(flycheck-warning )
   ;; `(flymake-end-of-line-diagnostics-face )
   ;; `(flymake-error )
   ;; `(flymake-error-echo )
   ;; `(flymake-error-echo-at-eol )
   ;; `(flymake-note )
   ;; `(flymake-note-echo )
   ;; `(flymake-note-echo-at-eol )
   ;; `(flymake-note-echo-at-eol )
   ;; `(flymake-warning )
   ;; `(flymake-warning-echo )
   ;; `(flyspell-duplicate )
   ;; `(flyspell-incorrect )
   ;; `(escape-glyph )
   ;; `(eglot-diagnostic-tag-unnecessary-face )
   ;; `(eglot-mode-line )
   `(eldoc-highlight-function-argument ((,class :foreground ,red-7 :weight bold)))
   ;; `(elisp-shorthand-font-lock-face )
   `(completions-common-part ((,class :foreground ,red-8)))
   `(completions-first-difference ((,class :foreground ,white-9 :weight bold)))
   ;; `(custom-button )
   ;; `(custom-button-mouse )
   ;; `(custom-button-pressed )
   ;; `(custom-changed )
   ;; `(custom-comment )
   ;; `(custom-comment-tag )
   ;; `(custom-face-tag )
   ;; `(custom-group-tag )
   ;; `(custom-group-tag-1 )
   ;; `(custom-invalid )
   ;; `(custom-modified )
   ;; `(custom-rogue )
   ;; `(custom-set )
   ;; `(custom-state )
   ;; `(custom-themed )
   ;; `(custom-variable-obsolete )
   ;; `(custom-variable-tag )
   ;; `(ansi-color-black )
   `(ansi-color-blue ((,class :background ,blue-2 :foreground ,blue-2)))
   ;; `(ansi-color-bold )
   ;; `(ansi-color-bright-black )
   `(ansi-color-bright-blue ((,class :background ,blue-7 :foreground ,blue-7)))
   ;; `(ansi-color-bright-cyan )
   ;; `(ansi-color-bright-green )
   ;; `(ansi-color-bright-magenta )
   ;; `(ansi-color-bright-red )
   ;; `(ansi-color-bright-white )
   ;; `(ansi-color-bright-yellow )
   ;; `(ansi-color-cyan )
   ;; `(ansi-color-green )
   ;; `(ansi-color-magenta )
   ;; `(ansi-color-red )
   ;; `(ansi-color-white )
   ;; `(ansi-color-yellow )
   ;; `(auto-dim-other-buffers-face )
   `(bookmark-face ((,class :foreground ,yellow-1 :distantforeground ,yellow-3)))
   ;; `(bookmark-menu-bookmark )
   ;; `(button )
   ;; `(child-frame-border )
   `(internal-border ((,class :background ,black-7)))


   ;; `(Info-quoted )
   ;; `(Man-overstrike )
   ;; `(Man-underline )
   ;; `(TeX-error-description-error )
   ;; `(TeX-error-description-help )
   ;; `(TeX-error-description-tex-said )
   ;; `(TeX-error-description-warning )
   ;; `(calendar-month-header )
   ;; `(calendar-today )
   ;; `(calendar-weekday-header )
   ;; `(calendar-weekend-header )
   ;; `(company-echo-common )
   ;; `(company-preview ((,class :foreground ,red-8)))
   ;; `(company-preview-common )
   ;; `(company-preview-search )
   ;; `(company-scrollbar-bg )
   ;; `(company-scrollbar-fg )
   ;; `(company-template-field )
   `(company-tooltip ((,class :foreground ,white-9 :background ,gray-4)))
   ;; `(company-tooltip-annotation )
   ;; `(company-tooltip-common )
   ;; `(company-tooltip-deprecated )
   ;; `(company-tooltip-mouse )
   ;; `(company-tooltip-scrollbar-thumb )
   ;; `(company-tooltip-scrollbar-track )
   ;; `(company-tooltip-search )
   ;; `(company-tooltip-search-selection )
   `(company-tooltip-selection ((,class :foreground ,black-1 :background ,white-7)))
   ;; `(compilation-column-number )
   ;; `(compilation-error )
   ;; `(compilation-info )
   ;; `(compilation-line-number )
   ;; `(compilation-mode-line-exit )
   ;; `(compilation-mode-line-fail )
   ;; `(compilation-mode-line-run )
   ;; `(compilation-warning )
   ;; `(diary )
   ;; `(dictionary-button-face )
   ;; `(dictionary-reference-face )
   ;; `(dictionary-word-definition-face )
   ;; `(dictionary-word-entry-face )
   `(diff-added ((,class :foreground ,green-8 :background ,green-2 :extend t :inherit (diff-changed))))
   `(diff-changed ((,class :background ,blue-1)))
   ;; `(diff-changed-unspecified )
   ;; `(diff-context )
   ;; `(diff-error )
   ;; `(diff-file-header )
   ;; `(diff-function )
   ;; `(diff-header )
   ;; `(diff-hl-change )
   ;; `(diff-hl-delete )
   ;; `(diff-hl-insert )
   ;; `(diff-hl-reverted-hunk-highlight )
   ;; `(diff-hunk-header )
   ;; `(diff-index )
   ;; `(diff-indicator-added )
   ;; `(diff-indicator-changed )
   ;; `(diff-indicator-removed )
   ;; `(diff-nonexistent )
   `(diff-refine-changed ((,class :background ,blue-1)))
   ;; `(diff-refine-added )
   ;; `(diff-refine-removed )
   `(diff-removed ((,class :background ,red-3 :extend t :inherit (diff-changed))))
   ;; `(dired-broken-symlink )
   ;; `(dired-directory )
   ;; `(dired-flagged )
   ;; `(dired-header )
   ;; `(dired-ignored )
   ;; `(dired-mark )
   ;; `(dired-marked )
   ;; `(dired-subtree-depth-1-face )
   ;; `(dired-subtree-depth-2-face )
   ;; `(dired-subtree-depth-3-face )
   ;; `(dired-subtree-depth-4-face )
   ;; `(dired-subtree-depth-5-face )
   ;; `(dired-subtree-depth-6-face )
   ;; `(dired-symlink )
   ;; `(dired-warning )
   ;; `(ediff-current-diff-A )
   ;; `(ediff-current-diff-Ancestor )
   ;; `(ediff-current-diff-B )
   ;; `(ediff-current-diff-C )
   ;; `(ediff-even-diff-A )
   ;; `(ediff-even-diff-Ancestor )
   ;; `(ediff-even-diff-B )
   ;; `(ediff-even-diff-C )
   ;; `(ediff-fine-diff-A )
   ;; `(ediff-fine-diff-Ancestor )
   ;; `(ediff-fine-diff-B )
   ;; `(ediff-fine-diff-C )
   ;; `(ediff-odd-diff-A )
   ;; `(ediff-odd-diff-Ancestor )
   ;; `(ediff-odd-diff-B )
   ;; `(ediff-odd-diff-C )
   ;; `(edmacro-label )
   ;; `(epa-field-body )
   ;; `(epa-field-name )
   ;; `(epa-mark )
   ;; `(epa-string )
   ;; `(epa-validity-disabled )
   ;; `(epa-validity-high )
   ;; `(epa-validity-low )
   ;; `(epa-validity-medium )
   ;; `(erc-action-face )
   ;; `(erc-bold-face )
   ;; `(erc-button )
   ;; `(erc-command-indicator-face )
   ;; `(erc-current-nick-face )
   ;; `(erc-dangerous-host-face )
   ;; `(erc-direct-msg-face )
   ;; `(erc-error-face )
   ;; `(erc-fill-wrap-merge-indicator-face )
   ;; `(erc-fool-face )
   ;; `(erc-input-face )
   ;; `(erc-inverse-face )
   ;; `(erc-keep-place-indicator-arrow )
   ;; `(erc-keyword-face )
   ;; `(erc-my-nick-face )
   ;; `(erc-my-nick-prefix-face )
   ;; `(erc-nick-default-face )
   ;; `(erc-nick-msg-face )
   ;; `(erc-nick-prefix-face )
   ;; `(erc-notice-face )
   ;; `(erc-pal-face )
   ;; `(erc-prompt-face )
   ;; `(erc-timestamp-face )
   ;; `(erc-underline-face )
   ;; `(ert-test-result-expected )
   ;; `(ert-test-result-unexpected )
   ;; `(eshell-ls-archive )
   ;; `(eshell-ls-backup )
   ;; `(eshell-ls-clutter )
   ;; `(eshell-ls-directory )
   ;; `(eshell-ls-executable )
   ;; `(eshell-ls-missing )
   ;; `(eshell-ls-product )
   ;; `(eshell-ls-readonly )
   ;; `(eshell-ls-special )
   ;; `(eshell-ls-symlink )
   ;; `(eshell-ls-unreadable )
   ;; `(eshell-prompt )
   ;; `(eww-form-checkbox )
   ;; `(eww-form-file )
   ;; `(eww-form-select )
   ;; `(eww-form-submit )
   ;; `(eww-form-text )
   ;; `(eww-form-textarea )
   ;; `(eww-invalid-certificate )
   ;; `(eww-valid-certificate )
   ;; `(font-latex-bold-face )
   ;; `(font-latex-doctex-documentation-face )
   ;; `(font-latex-doctex-preprocessor-face )
   ;; `(font-latex-italic-face )
   ;; `(font-latex-math-face )
   ;; `(font-latex-script-char-face )
   ;; `(font-latex-sectioning-5-face )
   ;; `(font-latex-sedate-face )
   ;; `(font-latex-slide-title-face )
   ;; `(font-latex-string-face )
   ;; `(font-latex-underline-face )
   ;; `(font-latex-verbatim-face )
   ;; `(font-latex-warning-face )
   ;; `(holiday )
   ;; `(ibuffer-locked-buffer )
   ;; `(image-dired-thumb-flagged )
   ;; `(image-dired-thumb-header-file-name )
   ;; `(image-dired-thumb-header-file-size )
   ;; `(image-dired-thumb-mark )
   ;; `(info-header-node )
   ;; `(info-index-match )
   ;; `(info-menu-header )
   ;; `(info-menu-star )
   ;; `(info-node )
   ;; `(info-title-1 )
   ;; `(info-title-2 )
   ;; `(info-title-3 )
   ;; `(info-title-4 )
   ;; `(magit-bisect-bad )
   ;; `(magit-bisect-good )
   ;; `(magit-bisect-skip )
   ;; `(magit-blame-date )
   ;; `(magit-blame-dimmed )
   ;; `(magit-blame-hash )
   ;; `(magit-blame-highlight )
   ;; `(magit-blame-name )
   ;; `(magit-blame-summary )
   `(magit-branch-local ((,class :foreground ,red-9)))
   `(magit-branch-remote ((,class :foreground ,yellow-4)))
   ;; `(magit-branch-upstream )
   ;; `(magit-branch-warning )
   ;; `(magit-cherry-equivalent )
   ;; `(magit-cherry-unmatched )
   ;; `(magit-diff-added )
   `(magit-diff-added-highlight ((,class :inherit (diff-added))))
   ;; `(magit-diff-base )
   ;; `(magit-diff-base-highlight )
   ;; `(magit-diff-context )
   ;; `(magit-diff-context-highlight )
   ;; `(magit-diff-file-heading )
   ;; `(magit-diff-file-heading-highlight )
   ;; `(magit-diff-file-heading-selection )
   `(magit-diff-hunk-heading ((,class :foreground ,green-4)))
   ;; `(magit-diff-hunk-heading-highlight )
   ;; `(magit-diff-hunk-heading-selection )
   ;; `(magit-diff-hunk-region )
   ;; `(magit-diff-lines-boundary )
   ;; `(magit-diff-lines-heading )
   ;; `(magit-diff-removed )
   `(magit-diff-removed-highlight ((,class :inherit (diff-removed))))
   ;; `(magit-diffstat-added )
   ;; `(magit-diffstat-removed )
   ;; `(magit-dimmed )
   ;; `(magit-filename )
   `(magit-hash ((,class :foreground ,yellow-1)))
   ;; `(magit-head )
   ;; `(magit-header-line )
   ;; `(magit-header-line-key )
   ;; `(magit-header-line-log-select )
   ;; `(magit-keyword )
   ;; `(magit-keyword-squash )
   ;; `(magit-log-author )
   ;; `(magit-log-date )
   ;; `(magit-log-graph )
   ;; `(magit-mode-line-process )
   ;; `(magit-mode-line-process-error )
   ;; `(magit-process-ng )
   ;; `(magit-process-ok )
   ;; `(magit-reflog-amend )
   ;; `(magit-reflog-checkout )
   ;; `(magit-reflog-cherry-pick )
   ;; `(magit-reflog-commit )
   ;; `(magit-reflog-merge )
   ;; `(magit-reflog-other )
   ;; `(magit-reflog-rebase )
   ;; `(magit-reflog-remote )
   ;; `(magit-reflog-reset )
   ;; `(magit-refname )
   ;; `(magit-refname-pullreq )
   ;; `(magit-refname-stash )
   ;; `(magit-refname-wip )
   ;; `(magit-section )
   ;; `(magit-section-heading )
   ;; `(magit-section-heading-selection )
   ;; `(magit-section-highlight )
   ;; `(magit-sequence-done )
   ;; `(magit-sequence-drop )
   ;; `(magit-sequence-exec )
   ;; `(magit-sequence-head )
   ;; `(magit-sequence-onto )
   ;; `(magit-sequence-part )
   ;; `(magit-sequence-pick )
   ;; `(magit-sequence-stop )
   ;; `(magit-signature-bad )
   ;; `(magit-signature-error )
   ;; `(magit-signature-expired )
   ;; `(magit-signature-expired-key )
   ;; `(magit-signature-good )
   ;; `(magit-signature-revoked )
   ;; `(magit-signature-untrusted )
   ;; `(magit-tag )
   ;; `(marginalia-archive )
   ;; `(marginalia-char )
   ;; `(marginalia-date )
   ;; `(marginalia-file-name )
   ;; `(marginalia-file-owner )
   ;; `(marginalia-file-priv-dir )
   ;; `(marginalia-file-priv-exec )
   ;; `(marginalia-file-priv-link )
   ;; `(marginalia-file-priv-no )
   ;; `(marginalia-file-priv-other )
   ;; `(marginalia-file-priv-rare )
   ;; `(marginalia-file-priv-read )
   ;; `(marginalia-file-priv-write )
   ;; `(marginalia-function )
   ;; `(marginalia-key )
   ;; `(marginalia-lighter )
   ;; `(marginalia-liqst )
   ;; `(marginalia-mode )
   ;; `(marginalia-modified )
   ;; `(marginalia-null )
   ;; `(marginalia-number )
   ;; `(marginalia-size )
   ;; `(marginalia-string )
   ;; `(marginalia-symbol )
   ;; `(marginalia-true )
   ;; `(marginalia-type )
   ;; `(marginalia-value )
   ;; `(marginalia-version )
   ;; `(markdown-blockquote-face )
   ;; `(markdown-bold-face )
   ;; `(markdown-code-face )
   ;; `(markdown-gfm-checkbox-face )
   ;; `(markdown-header-face )
   ;; `(markdown-header-face-1 )
   ;; `(markdown-header-face-2 )
   ;; `(markdown-header-face-3 )
   ;; `(markdown-header-face-4 )
   ;; `(markdown-header-face-5 )
   ;; `(markdown-header-face-6 )
   ;; `(markdown-highlighting-face )
   ;; `(markdown-inline-code-face )
   ;; `(markdown-italic-face )
   ;; `(markdown-language-keyword-face )
   ;; `(markdown-line-break-face )
   ;; `(markdown-link-face )
   ;; `(markdown-markup-face )
   ;; `(markdown-metadata-key-face )
   ;; `(markdown-metadata-value-face )
   ;; `(markdown-missing-link-face )
   ;; `(markdown-pre-face )
   ;; `(markdown-table-face )
   ;; `(markdown-url-face )
   ;; `(message-cited-text-1 )
   ;; `(message-cited-text-2 )
   ;; `(message-cited-text-3 )
   ;; `(message-cited-text-4 )
   ;; `(message-header-cc )
   ;; `(message-header-name )
   ;; `(message-header-newsgroups )
   ;; `(message-header-other )
   ;; `(message-header-subject )
   ;; `(message-header-to )
   ;; `(message-header-xheader )
   ;; `(message-mml )
   ;; `(message-separator )
   ;; `(mm-command-output )
   ;; `(mu4e-attach-number-face )
   ;; `(notmuch-crypto-decryption )
   ;; `(notmuch-crypto-part-header )
   ;; `(notmuch-crypto-signature-bad )
   ;; `(notmuch-crypto-signature-good )
   ;; `(notmuch-crypto-signature-good-key )
   ;; `(notmuch-crypto-signature-unknown )
   ;; `(notmuch-jump-key )
   ;; `(notmuch-message-summary-face )
   ;; `(notmuch-search-count )
   ;; `(notmuch-search-date )
   ;; `(notmuch-search-flagged-face )
   ;; `(notmuch-search-matching-authors )
   ;; `(notmuch-search-non-matching-authors )
   ;; `(notmuch-search-subject )
   ;; `(notmuch-search-unread-face )
   ;; `(notmuch-tag-added )
   ;; `(notmuch-tag-deleted )
   ;; `(notmuch-tag-face )
   ;; `(notmuch-tag-flagged )
   ;; `(notmuch-tag-unread )
   ;; `(notmuch-tree-match-author-face )
   ;; `(notmuch-tree-match-date-face )
   ;; `(notmuch-tree-match-face )
   ;; `(notmuch-tree-match-tag-face )
   ;; `(notmuch-tree-no-match-date-face )
   ;; `(notmuch-tree-no-match-face )
   ;; `(notmuch-wash-cited-text )
   ;; `(notmuch-wash-toggle-button )
   ;; `(org-agenda-calendar-daterange )
   `(org-agenda-calendar-event ((,class :foreground ,blue-7)))
   ;; `(org-agenda-calendar-sexp )
   ;; `(org-agenda-clocking )
   ;; `(org-agenda-column-dateline )
   `(org-agenda-current-time ((,class :foreground ,green-6)))
   `(org-agenda-date ((,class :foreground ,red-7)))
   `(org-agenda-date-today ((,class :underline t :inherit (org-agenda-date))))
   ;; `(org-agenda-date-weekend )
   ;; `(org-agenda-date-weekend-today )
   ;; `(org-agenda-diary )
   ;; `(org-agenda-dimmed-todo-face )
   `(org-agenda-done ((,class :inherit (success))))
   ;; `(org-agenda-filter-category )
   ;; `(org-agenda-filter-effort )
   ;; `(org-agenda-filter-regexp )
   ;; `(org-agenda-filter-tags )
   ;; `(org-agenda-restriction-lock )
   `(org-agenda-structure ((,class :foreground ,red-5)))
   ;; `(org-agenda-structure-filter )
   ;; `(org-agenda-structure-secondary )
   ;; `(org-archived )
   `(org-block ((,class :foreground ,text-fg)))
   `(org-block-begin-line ((,class :foreground ,yellow-1)))
   ;; `(org-block-end-line )
   ;; `(org-checkbox )
   ;; `(org-clock-overlay )
   ;; `(org-code )
   ;; `(org-column )
   ;; `(org-column-title )
   ;; `(org-date )
   ;; `(org-date-selected )
   ;; `(org-document-info )
   `(org-document-info-keyword ((,class :foreground ,gray-6)))
   `(org-document-title ((,class :foreground ,green-5 :height 1.5 :weight bold)))
   `(org-level-1 ((,class :foreground ,green-7)))
   `(org-level-2 ((,class :foreground ,green-6)))
   `(org-level-3 ((,class :foreground ,green-2)))
   `(org-level-4 ((,class :foreground ,green-3)))
   `(org-level-5 ((,class :foreground ,green-4)))
   `(org-level-6 ((,class :foreground ,green-1)))
   ;; `(org-level-7 )
   ;; `(org-level-8 )
   ;; `(org-done )
   `(org-drawer ((,class :inherit (shadow))))
   ;; `(org-ellipsis )
   ;; `(org-footnote )
   ;; `(org-formula )
   `(org-habit-alert-face ((,class :background ,yellow-1)))
   ;; `(org-habit-alert-future-face )
   ;; `(org-habit-clear-face )
   ;; `(org-habit-clear-future-face )
   `(org-habit-overdue-face ((,class :background ,red-9)))
   `(org-habit-overdue-future-face ((,class :background ,red-7)))
   ;; `(org-habit-ready-face )
   ;; `(org-habit-ready-future-face )
   ;; `(org-hide )
   ;; `(org-imminent-deadline )
   ;; `(org-indent )
   ;; `(org-latex-and-related )
   ;; `(org-link )
   ;; `(org-list-dt )
   ;; `(org-macro )
   ;; `(org-meta-line )
   ;; `(org-mode-line-clock )
   ;; `(org-mode-line-clock-overrun )
   ;; `(org-modern-date-active )
   ;; `(org-modern-date-inactive )
   ;; `(org-modern-done )
   ;; `(org-modern-priority )
   ;; `(org-modern-statistics )
   ;; `(org-modern-tag )
   ;; `(org-modern-time-active )
   ;; `(org-modern-time-inactive )
   ;; `(org-modern-todo )
   ;; `(org-priority )
   ;; `(org-property-value )
   ;; `(org-quote )
   ;; `(org-scheduled )
   `(org-scheduled-today ((,class :foreground ,green-7)))
   ;; `(org-sexp-date )
   ;; `(org-special-keyword )
   ;; `(org-table )
   ;; `(org-table-header )
   `(org-tag ((,class :foreground ,yellow-3)))
   ;; `(org-tag-group )
   ;; `(org-target )
   `(org-ti
     me-grid ((,class :foreground ,green-2 :weight light)))
   `(org-todo ((,class :foreground ,red-6)))
   ;; `(org-upcoming-deadline )
   ;; `(org-upcoming-distant-deadline )
   ;; `(org-verbatim )
   ;; `(org-verse )
   ;; `(org-warning )
   ;; `(outline-1 )
   ;; `(outline-2 )
   ;; `(outline-3 )
   ;; `(outline-4 )
   ;; `(outline-5 )
   ;; `(outline-6 )
   ;; `(outline-7 )
   ;; `(outline-8 )
   ;; `(package-description )
   ;; `(package-help-section-name )
   ;; `(package-name )
   ;; `(package-status-avail-obso )
   ;; `(package-status-available )
   ;; `(package-status-built-in )
   ;; `(package-status-dependency )
   ;; `(package-status-disabled )
   ;; `(package-status-from-source )
   ;; `(package-status-held )
   ;; `(package-status-incompat )
   ;; `(package-status-installed )
   ;; `(package-status-new )
   ;; `(package-status-unsigned )
   ;; `(persp-selected-face )
   ;; `(rcirc-bright-nick )
   ;; `(rcirc-dim-nick )
   ;; `(rcirc-monospace-text )
   ;; `(rcirc-my-nick )
   ;; `(rcirc-nick-in-message )
   ;; `(rcirc-nick-in-message-full-line )
   ;; `(rcirc-other-nick )
   ;; `(rcirc-prompt )
   ;; `(rcirc-server )
   ;; `(rcirc-timestamp )
   ;; `(rcirc-track-keyword )
   ;; `(rcirc-track-nick )
   ;; `(rcirc-url )
   ;; `(reb-match-0 )
   ;; `(reb-match-1 )
   ;; `(reb-match-2 )
   ;; `(reb-match-3 )
   ;; `(reb-regexp-grouping-backslash )
   ;; `(reb-regexp-grouping-construct )
   ;; `(ruler-mode-column-number )
   ;; `(ruler-mode-comment-column )
   ;; `(ruler-mode-current-column )
   ;; `(ruler-mode-default )
   ;; `(ruler-mode-fill-column )
   ;; `(ruler-mode-fringes )
   ;; `(ruler-mode-goal-column )
   ;; `(ruler-mode-margins )
   ;; `(ruler-mode-pad )
   ;; `(ruler-mode-tab-stop )
   ;; `(shr-code )
   ;; `(shr-h1 )
   ;; `(shr-h2 )
   ;; `(shr-h3 )
   ;; `(shr-h4 )
   ;; `(shr-h5 )
   ;; `(shr-h6 )
   ;; `(shr-mark )
   ;; `(shr-selected-link )
   ;; `(smerge-base )
   ;; `(smerge-lower )
   ;; `(smerge-markers )
   ;; `(smerge-refined-added )
   ;; `(smerge-refined-changed )
   ;; `(smerge-refined-removed )
   ;; `(smerge-upper )
   ;; `(tempel-default )
   ;; `(tempel-field )
   ;; `(tempel-form )
   ;; `(term )
   ;; `(term-bold )
   ;; `(term-color-black )
   ;; `(term-color-blue )
   ;; `(term-color-cyan )
   ;; `(term-color-green )
   ;; `(term-color-magenta )
   ;; `(term-color-red )
   ;; `(term-color-white )
   ;; `(term-color-yellow )
   ;; `(term-underline )
   ;; `(tex-verbatim )
   ;; `(textsec-suspicious )
   ;; `(trailing-whitespace )
   ;; `(transient-active-infix )
   ;; `(transient-amaranth )
   ;; `(transient-argument )
   ;; `(transient-blue )
   ;; `(transient-disabled-suffix )
   ;; `(transient-enabled-suffix )
   ;; `(transient-heading )
   ;; `(transient-inactive-argument )
   ;; `(transient-inactive-value )
   ;; `(transient-key )
   ;; `(transient-mismatched-key )
   ;; `(transient-nonstandard-key )
   ;; `(transient-pink )
   ;; `(transient-purple )
   ;; `(transient-red )
   ;; `(transient-teal )
   ;; `(transient-unreachable )
   ;; `(transient-unreachable-key )
   ;; `(transient-value )
   ;; `(trashed-restored )
   `(tree-sitter-hl-face:attribute ((,class :foreground ,red-0)))
   `(tree-sitter-hl-face:constant.builtin ((,class :foreground ,red-6)))
   ;; `(tree-sitter-hl-face:escape )
   `(tree-sitter-hl-face:function ((,class :foreground ,yellow-2)))
   ;; `(tree-sitter-hl-face:function.call )
   ;; `(tree-sitter-hl-face:label )
   ;; `(tree-sitter-hl-face:method.call )
   ;; `(tree-sitter-hl-face:operator )
   `(tree-sitter-hl-face:property ((,class :blue-3)))
   `(tree-sitter-hl-face:property.definition ((,class :foreground ,yellow-4)))
   ;; `(tree-sitter-hl-face:punctuation )
   ;; `(tree-sitter-hl-face:punctuation.bracket )
   ;; `(tree-sitter-hl-face:punctuation.delimiter )
   ;; `(tree-sitter-hl-face:punctuation.special )
   ;; `(tree-sitter-hl-face:string.special )
   ;; `(tree-sitter-hl-face:tag )
   `(tree-sitter-hl-face:type.argument ((,class :foreground ,yellow-4)))
   ;; `(vc-conflict-state )
   ;; `(vc-dir-directory )
   ;; `(vc-dir-file )
   ;; `(vc-dir-header )
   ;; `(vc-dir-header-value )
   ;; `(vc-dir-mark-indicator )
   ;; `(vc-dir-status-edited )
   ;; `(vc-dir-status-ignored )
   ;; `(vc-dir-status-up-to-date )
   ;; `(vc-dir-status-warning )
   ;; `(vc-edited-state )
   ;; `(vc-git-log-edit-summary-max-warning )
   ;; `(vc-git-log-edit-summary-target-warning )
   ;; `(vc-locally-added-state )
   ;; `(vc-locked-state )
   ;; `(vc-missing-state )
   ;; `(vc-needs-update-state )
   ;; `(vc-removed-state )
   ;; `(vc-state-base )
   ;; `(vc-up-to-date-state )
   ;; `(vertico-current )
   ;; `(vertico-group-title )
   ;; `(wgrep-delete-face )
   `(wgrep-done-face ((,class :foreground ,green-7)))
   ;; `(wgrep-face )
   ;; `(wgrep-file-face )
   ;; `(wgrep-reject-face )
   ;; `(which-func )
   ;; `(which-key-command-description-face )
   ;; `(which-key-group-description-face )
   ;; `(which-key-highlighted-command-face )
   ;; `(which-key-key-face )
   ;; `(which-key-local-map-description-face )
   ;; `(which-key-note-face )
   ;; `(which-key-separator-face )
   ;; `(which-key-special-key-face )
   ;; `(whitespace-big-indent )
   ;; `(whitespace-empty )
   ;; `(whitespace-hspace )
   ;; `(whitespace-indentation )
   ;; `(whitespace-line )
   ;; `(whitespace-newline )
   ;; `(whitespace-space )
   ;; `(whitespace-space-after-tab )
   ;; `(whitespace-space-before-tab )
   ;; `(whitespace-tab )
   ;; `(whitespace-trailing )
   ;; `(widget-button )
   ;; `(widget-button-pressed )
   ;; `(widget-documentation )
   `(widget-field ((,class :foreground ,bg :background ,gray-4 :extend t :slant italic)))
   ;; `(widget-inactive )
   ;; `(widget-single-line-field )
   ;; `(woman-addition )
   ;; `(woman-bold )
   ;; `(woman-italic )
   ;; `(woman-unknown )
   )

  (custom-theme-set-variables
   'mejelly
   ;; Add any theme-related variables here if necessary
   )

  (provide-theme 'mejelly))
  ;;; vim-inspired-theme.el ends here
