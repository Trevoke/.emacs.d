;;; modus-jellybeans-dark-theme.el --- Jellybeans dark on modus-vivendi -*- lexical-binding: t -*-

;; Copyright (C) 2026 Free Software Foundation, Inc.
;; Author: Aldric Giacomoni <trevoke@gmail.com>
;; Maintainer: Aldric Giacomoni <trevoke@gmail.com>
;; URL: https://github.com/Trevoke/modus-jellybeans
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
;; A faithful port of NanoTech's jellybeans.vim.  Every colour below that
;; is annotated with a Vim group name is taken verbatim from the Vim
;; colour file.  Values marked "derived" have no jellybeans counterpart
;; and are blended from a jellybeans accent toward `bg-main'.

;;; Code:

(require 'modus-jellybeans)

(defconst modus-jellybeans-dark-palette
  (modus-themes-generate-palette
   '(
     ;; ----------------------------------------------------------------
     ;; Core.  Vim: Normal fg #e8e8d3 on bg #151515.
     ;; ----------------------------------------------------------------
     (bg-main     "#151515") ; Normal guibg
     (bg-dim      "#1c1c1c") ; CursorLine / CursorColumn
     (bg-active   "#404040") ; Visual
     (bg-inactive "#1f1f1f") ; FoldColumn guibg
     (border      "#403c41") ; VertSplit guibg
     (fg-main     "#e8e8d3") ; Normal guifg
     (fg-dim      "#888888") ; Comment
     (fg-alt      "#c6b6ee") ; Identifier
     (cursor      "#b0d0f0") ; Cursor guibg

     ;; ----------------------------------------------------------------
     ;; The jellybeans syntax vocabulary, named after the Vim groups.
     ;; `modus-jellybeans-common-palette-mappings' points Modus's
     ;; semantic slots at these.
     ;; ----------------------------------------------------------------
     (jellybeans-normal      "#e8e8d3") ; Normal
     (jellybeans-comment     "#888888") ; Comment (italic)
     (jellybeans-string      "#99ad6a") ; String
     (jellybeans-stringdelim "#556633") ; StringDelimiter
     (jellybeans-constant    "#cf6a4c") ; Constant
     (jellybeans-identifier  "#c6b6ee") ; Identifier
     (jellybeans-structure   "#8fbfdc") ; Structure / PreProc / Operator
     (jellybeans-function    "#fad07a") ; Function
     (jellybeans-statement   "#8197bf") ; Statement
     (jellybeans-type        "#ffb964") ; Type
     (jellybeans-special     "#799d6a") ; Special (also SpecialComment)
     (jellybeans-delimiter   "#668799") ; Delimiter
     (jellybeans-title       "#70b950") ; Title
     (jellybeans-question    "#65C254") ; Question
     (jellybeans-directory   "#dad085") ; Directory
     (jellybeans-storage     "#c59f6f") ; StorageClass
     (jellybeans-predefined  "#de5577") ; rubyPredefinedIdentifier / erlangBIF
     (jellybeans-regexp      "#dd0093") ; rubyRegexp
     (jellybeans-search-fg   "#f0a0c0") ; Search / WildMenu guifg
     (jellybeans-modeline-fg "#000000") ; StatusLine guifg (jellybeans'
                                        ; mode line is LIGHT even here)

     ;; ----------------------------------------------------------------
     ;; Modus's colour vocabulary, filled from the jellybeans palette.
     ;; jellybeans has no true cyan; its light blue (#8fbfdc) serves.
     ;; ----------------------------------------------------------------
     (red            "#cf6a4c") ; Constant
     (red-warmer     "#cf6a4c")
     (red-cooler     "#de5577") ; rubyPredefinedIdentifier
     (red-faint      "#c59f6f") ; StorageClass
     (red-intense    "#de5577")
     (green          "#99ad6a") ; String
     (green-warmer   "#b9ed67") ; PreciseJumpTarget
     (green-cooler   "#799d6a") ; Special
     (green-faint    "#556633") ; StringDelimiter
     (green-intense  "#65c254") ; Question
     (yellow         "#fad07a") ; Function
     (yellow-warmer  "#ffb964") ; Type
     (yellow-cooler  "#dad085") ; Directory
     (yellow-faint   "#c59f6f") ; StorageClass
     (yellow-intense "#fad07a")
     (blue           "#8197bf") ; Statement
     (blue-warmer    "#7697d6") ; rubySymbol
     (blue-cooler    "#8fbfdc") ; Structure / PreProc
     (blue-faint     "#668799") ; Delimiter
     (blue-intense   "#b0d0f0") ; Cursor
     (magenta          "#c6b6ee") ; Identifier
     (magenta-warmer   "#f0a0c0") ; Search
     (magenta-cooler   "#c6b6ee")
     (magenta-faint    "#de5577")
     (magenta-intense  "#dd0093") ; rubyRegexp
     (cyan           "#8fbfdc")
     (cyan-warmer    "#b0d0f0")
     (cyan-cooler    "#8fbfdc")
     (cyan-faint     "#668799")
     (cyan-intense   "#b0d0f0")
     (rust   "#cf6a4c")
     (gold   "#c59f6f")
     (olive  "#99ad6a")
     (slate  "#668799")
     (indigo "#c6b6ee")
     (maroon "#de5577")
     (pink   "#f0a0c0")

     ;; ----------------------------------------------------------------
     ;; Tinted backgrounds.  Where jellybeans has a real value it is used;
     ;; the rest are derived by blending the accent toward bg-main.
     ;; ----------------------------------------------------------------
     (bg-red-intense     "#902020") ; ErrorMsg / SpellBad guibg
     (bg-green-intense   "#437019") ; DiffAdd guibg
     (bg-yellow-intense  "#473e2b") ; derived
     (bg-blue-intense    "#2b5b77") ; DiffChange guibg
     (bg-magenta-intense "#540063") ; SpellRare / rubyRegexpDelimiter
     (bg-cyan-intense    "#2d7067") ; SpellLocal guibg
     (bg-red-subtle      "#700009") ; DiffDelete guibg
     (bg-green-subtle    "#323628") ; derived
     (bg-yellow-subtle   "#473e2b") ; derived
     (bg-blue-subtle     "#2d323a") ; derived
     (bg-magenta-subtle  "#302028") ; Search / WildMenu guibg
     (bg-cyan-subtle     "#303a41") ; derived
     (bg-red-nuanced     "#291e1b") ; derived
     (bg-green-nuanced   "#24261e") ; derived
     (bg-yellow-nuanced  "#2e2a20") ; derived
     (bg-blue-nuanced    "#212328") ; derived
     (bg-magenta-nuanced "#28272d") ; derived
     (bg-cyan-nuanced    "#22282b") ; derived

     ;; Thematic slots.
     (bg-clay     "#40000a") ; DiffDelete guifg, used here as a ground
     (fg-clay     "#cf6a4c")
     (bg-ochre    "#2e2a20")
     (fg-ochre    "#dad085")
     (bg-lavender "#302028")
     (fg-lavender "#c6b6ee")
     (bg-sage     "#2d7067") ; SpellLocal
     (fg-sage     "#d2ebbe") ; DiffAdd guifg

     ;; Graphs.
     (bg-graph-red-0     "#cf6a4c")
     (bg-graph-red-1     "#700009")
     (bg-graph-green-0   "#b9ed67")
     (bg-graph-green-1   "#437019")
     (bg-graph-yellow-0  "#fad07a")
     (bg-graph-yellow-1  "#c59f6f")
     (bg-graph-blue-0    "#8fbfdc")
     (bg-graph-blue-1    "#447799") ; rubyClass
     (bg-graph-magenta-0 "#c6b6ee")
     (bg-graph-magenta-1 "#540063")
     (bg-graph-cyan-0    "#b0d0f0")
     (bg-graph-cyan-1    "#2d7067")

     ;; ----------------------------------------------------------------
     ;; Editor chrome.
     ;; ----------------------------------------------------------------
     (bg-completion      "#384048") ; Folded guibg
     ;; jellybeans' Pmenu is white text on #606060, which works for plain
     ;; text (5.07:1) but not for the ACCENTED text Modus draws in modern
     ;; completion popups (corfu/company annotations, match highlights):
     ;; green docstring on #606060 is only 2.56:1.  Darkened to #1c1c1c
     ;; (jellybeans' own CursorLine) so every accent clears AA on it.
     (bg-popup           "#1c1c1c")
     (bg-hover           "#384048")
     (bg-hover-secondary "#302028")
     ;; jellybeans' CursorLine is #1c1c1c, only 7 levels above bg-main and
     ;; nearly invisible in practice.  #232323 (its IndentGuidesOdd) is a
     ;; deliberate, in-palette step up that stays well below bg-region.
     (bg-hl-line         "#232323")
     (bg-region          "#404040") ; Visual

     ;; jellybeans' StatusLine is LIGHT (#dddddd) even on the dark theme --
     ;; one of its signatures.  The mode line accents below are therefore
     ;; DARK, re-derived from the jellybeans hues to sit legibly on it.
     (bg-mode-line-active       "#dddddd") ; StatusLine guibg
     (fg-mode-line-active       "#000000") ; StatusLine guifg -- jellybeans'
                                        ; mode line is light with BLACK text.
                                        ; Without this, Modus derives fg from
                                        ; fg-main (#e8e8d3) and it lands at
                                        ; 1.09:1 on the light bg -- invisible.
     (border-mode-line-active   "#777777") ; VertSplit guifg
     (bg-mode-line-inactive     "#403c41") ; StatusLineNC guibg
     (fg-mode-line-inactive     "#ffffff") ; StatusLineNC guifg
     (border-mode-line-inactive "#403c41")
     (modeline-err     "#8c3d26") ; derived from Constant
     (modeline-warning "#804600") ; derived from Type
     (modeline-info    "#265a79") ; derived from Structure

     (bg-tab-bar     "#403c41") ; TabLineFill-ish
     (bg-tab-current "#151515")
     (bg-tab-other   "#384048")

     ;; ----------------------------------------------------------------
     ;; Diffs.  Vim: DiffAdd #D2EBBE on #437019, DiffDelete #40000A on
     ;; #700009, DiffChange on #2B5B77.
     ;; ----------------------------------------------------------------
     (bg-added           "#2c4a12")
     (bg-added-faint     "#1f330d")
     (bg-added-refine    "#437019") ; DiffAdd guibg
     (bg-added-fringe    "#70b950")
     (fg-added           "#d2ebbe") ; DiffAdd guifg
     (fg-added-intense   "#b9ed67")
     (bg-removed         "#4a0a10")
     (bg-removed-faint   "#330a0c")
     (bg-removed-refine  "#700009") ; DiffDelete guibg
     (bg-removed-fringe  "#902020")
     (fg-removed         "#de5577")
     (fg-removed-intense "#cf6a4c")
     (bg-changed         "#24455a")
     (bg-changed-faint   "#1a3240")
     (bg-changed-refine  "#2b5b77") ; DiffChange guibg
     (bg-changed-fringe  "#8fbfdc")
     (fg-changed         "#8fbfdc") ; DiffText guifg
     (fg-changed-intense "#b0d0f0")
     (bg-diff-context    "#1a1a1a")

     ;; ----------------------------------------------------------------
     ;; Search and parens.  Vim: Search #f0a0c0 on #302028 (underline);
     ;; MatchParen #ffffff on #556779 (bold).
     ;; ----------------------------------------------------------------
     (bg-search-current    "#302028") ; Search guibg
     (bg-search-lazy       "#2d323a")
     (bg-search-static     "#322828")
     (bg-search-replace    "#540063")
     (bg-search-rx-group-0 "#2b5b77")
     (bg-search-rx-group-1 "#437019")
     (bg-search-rx-group-2 "#700009")
     (bg-search-rx-group-3 "#540063")
     (bg-paren-match      "#556779") ; MatchParen guibg
     (bg-paren-expression "#302028"))
   nil
   modus-themes-vivendi-palette
   modus-jellybeans-common-palette-mappings)
  "Full palette for `modus-jellybeans-dark'.")

(defcustom modus-jellybeans-dark-palette-overrides nil
  "Palette overrides for `modus-jellybeans-dark'.
Entries here take precedence over both the theme palette and
`modus-jellybeans-common-palette-overrides'.
See `modus-themes-common-palette-overrides' for the format."
  :group 'modus-jellybeans
  :type '(repeat (list symbol (choice symbol string))))

;;;###theme-autoload
(modus-themes-theme
 'modus-jellybeans-dark
 'modus-jellybeans
 "Jellybeans dark palette on modus-vivendi."
 'dark
 'modus-themes-vivendi-palette
 'modus-jellybeans-dark-palette
 'modus-jellybeans-dark-palette-overrides)

(provide-theme 'modus-jellybeans-dark)
;;; modus-jellybeans-dark-theme.el ends here
