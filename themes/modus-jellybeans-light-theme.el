;;; modus-jellybeans-light-theme.el --- Jellybeans-inspired light on modus-operandi -*- lexical-binding: t -*-

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
;; IMPORTANT: this is NOT a port.  Upstream jellybeans is dark-only and
;; has been for its entire history; there is no light jellybeans to port.
;; Nor can the dark palette simply be reused: not one of its eighteen
;; foreground colours reaches even WCAG AA on a light background, because
;; jellybeans is tuned to sit in a single narrow luminance band.
;;
;; This is therefore an original light scheme that tries to be recognisably
;; of the same family.  The method:
;;
;;   1. Start from Aldric's `mejelly-light', which was already designed for
;;      projector use and had independently arrived at the right HUES --
;;      blue keywords, green strings, purple variables.
;;   2. Keep every colour from it that already cleared WCAG AA.
;;   3. For the rest, hold hue and saturation fixed and move only
;;      lightness.  Hue drift from the dark theme is under 1 degree for
;;      every re-derived colour.
;;   4. Choose each target contrast by MIRRORING the dark theme's contrast
;;      ordering, compressed into the 4.7-8.6 range that a cream
;;      background can actually support.  Mirroring exactly would push the
;;      yellows to near-black (#392702 is not yellow, it is brown);
;;      flattening everything to one ratio would collapse the five
;;      jellybeans greens into mud.  Compression preserves the ordering
;;      that separates them without destroying hue identity.
;;
;; One deliberate correction to `mejelly-light': it mapped `constant' to
;; blue (#074e8d) while the dark theme's Constant is an orange-red
;; (#cf6a4c) -- a 166 degree hue break, the only real inconsistency
;; between the two.  Constant is re-derived from the dark hue here.

;;; Code:

(require 'modus-jellybeans)

(defconst modus-jellybeans-light-palette
  (modus-themes-generate-palette
   '(
     ;; ----------------------------------------------------------------
     ;; Core.  The cream background echoes jellybeans' warm #e8e8d3
     ;; foreground rather than going to a clinical white.
     ;; ----------------------------------------------------------------
     (bg-main     "#f5efda")
     (bg-dim      "#e9e4cf")
     (bg-active   "#d7d2bc")
     (bg-inactive "#e3e3e3")
     (border      "#b1ad94")
     (fg-main     "#323211")
     (fg-dim      "#525252")
     (fg-alt      "#592ec4")
     (cursor      "#245370")

     ;; ----------------------------------------------------------------
     ;; The jellybeans vocabulary, light.  "kept" = passed AA already in
     ;; mejelly-light and was left alone.  "derived" = hue held, lightness
     ;; retargeted.  Ratios are against bg-main.
     ;; ----------------------------------------------------------------
     (jellybeans-normal      "#323211") ; kept    11.40
     (jellybeans-comment     "#525252") ; kept     6.79
     (jellybeans-string      "#505d32") ; derived  6.18
     (jellybeans-stringdelim "#5e7138") ; derived  4.68
     (jellybeans-constant    "#9f452b") ; derived  5.43  (was blue: hue break)
     (jellybeans-identifier  "#592ec4") ; derived  6.98
     (jellybeans-structure   "#245370") ; kept     7.16
     (jellybeans-function    "#614304") ; derived  7.89
     (jellybeans-statement   "#3a5ca6") ; kept     5.59
     (jellybeans-type        "#754000") ; derived  7.33
     (jellybeans-special     "#456637") ; derived  5.68
     (jellybeans-delimiter   "#495f83") ; kept     5.62
     (jellybeans-title       "#396127") ; derived  6.26
     (jellybeans-question    "#2c6123") ; derived  6.42
     (jellybeans-directory   "#534c19") ; derived  7.55
     (jellybeans-storage     "#70522d") ; derived  6.22
     (jellybeans-predefined  "#b82449") ; derived  5.39
     (jellybeans-regexp      "#c30081") ; derived  5.01
     (jellybeans-search-fg   "#9e194e") ; derived  6.75
     (jellybeans-modeline-fg "#323211")

     ;; ----------------------------------------------------------------
     ;; Modus's colour vocabulary.
     ;; ----------------------------------------------------------------
     (red            "#9f452b")
     (red-warmer     "#9f452b")
     (red-cooler     "#b82449")
     (red-faint      "#70522d")
     (red-intense    "#b82449")
     (green          "#505d32")
     (green-warmer   "#396127")
     (green-cooler   "#456637")
     (green-faint    "#5e7138")
     (green-intense  "#2c6123")
     (yellow         "#614304")
     (yellow-warmer  "#754000")
     (yellow-cooler  "#534c19")
     (yellow-faint   "#70522d")
     (yellow-intense "#614304")
     (blue           "#3a5ca6")
     (blue-warmer    "#3a5ca6")
     (blue-cooler    "#245370")
     (blue-faint     "#495f83")
     (blue-intense   "#074e8d")
     (magenta          "#592ec4")
     (magenta-warmer   "#9e194e")
     (magenta-cooler   "#592ec4")
     (magenta-faint    "#b82449")
     (magenta-intense  "#c30081")
     (cyan           "#245370")
     (cyan-warmer    "#074e8d")
     (cyan-cooler    "#245370")
     (cyan-faint     "#495f83")
     (cyan-intense   "#074e8d")
     (rust   "#9f452b")
     (gold   "#70522d")
     (olive  "#505d32")
     (slate  "#495f83")
     (indigo "#592ec4")
     (maroon "#b82449")
     (pink   "#9e194e")

     ;; ----------------------------------------------------------------
     ;; Tinted backgrounds, blended from each accent toward bg-main so
     ;; they stay in the warm cream family rather than going grey.
     ;; ----------------------------------------------------------------
     (bg-red-intense     "#dbbca5")
     (bg-green-intense   "#c3c3a8")
     (bg-yellow-intense  "#c9bb9a")
     (bg-blue-intense    "#bdc3ca")
     (bg-magenta-intense "#c6b5d3")
     (bg-cyan-intense    "#b6c0ba")
     (bg-red-subtle      "#e6d2bc")
     (bg-green-subtle    "#d9d6bd")
     (bg-yellow-subtle   "#dcd2b6")
     (bg-blue-subtle     "#d5d6d1")
     (bg-magenta-subtle  "#daced6")
     (bg-cyan-subtle     "#d1d4c8")
     (bg-red-nuanced     "#eee1cc")
     (bg-green-nuanced   "#e8e3cd")
     (bg-yellow-nuanced  "#e9e1c9")
     (bg-blue-nuanced    "#e6e3d6")
     (bg-magenta-nuanced "#e9e0d8")
     (bg-cyan-nuanced    "#e4e3d2")

     (bg-clay     "#dbbca5")
     (fg-clay     "#9f452b")
     (bg-ochre    "#e9e1c9")
     (fg-ochre    "#534c19")
     (bg-lavender "#c6b5d3")
     (fg-lavender "#592ec4")
     (bg-sage     "#c3c3a8")
     (fg-sage     "#456637")

     (bg-graph-red-0     "#9f452b")
     (bg-graph-red-1     "#dbbca5")
     (bg-graph-green-0   "#396127")
     (bg-graph-green-1   "#c3c3a8")
     (bg-graph-yellow-0  "#614304")
     (bg-graph-yellow-1  "#c9bb9a")
     (bg-graph-blue-0    "#3a5ca6")
     (bg-graph-blue-1    "#bdc3ca")
     (bg-graph-magenta-0 "#592ec4")
     (bg-graph-magenta-1 "#c6b5d3")
     (bg-graph-cyan-0    "#245370")
     (bg-graph-cyan-1    "#b6c0ba")

     ;; ----------------------------------------------------------------
     ;; Editor chrome.
     ;; ----------------------------------------------------------------
     (bg-completion      "#dcd2b6")
     (bg-popup           "#ede8d3")
     (bg-hover           "#d9d6bd")
     (bg-hover-secondary "#e6d2bc")
     ;; mejelly-light used #e3e3e3 here, a neutral grey against a warm
     ;; cream page.  Warmed into the bg family so the band reads as the
     ;; same paper rather than a grey overlay.
     (bg-hl-line         "#e9e4cf")
     (bg-region          "#a8f0ef") ; kept from mejelly-light

     ;; jellybeans' dark theme has a distinctive LIGHT mode line; the
     ;; light theme answers it with a warm cream one, kept from
     ;; mejelly-light.  Accents on it must stay dark.
     (bg-mode-line-active       "#f7e7b0") ; kept from mejelly-light
     (border-mode-line-active   "#b1ad94")
     (bg-mode-line-inactive     "#e3e3e3") ; kept from mejelly-light
     ;; mejelly-light used #7f7f7f here, which is only 3.12:1 on the
     ;; inactive mode line -- too faint even for de-emphasized text.
     ;; Matched to Modus operandi's own tested value.
     (fg-mode-line-inactive     "#585858")
     (border-mode-line-inactive "#c4c4c4")
     (modeline-err     "#9f452b")
     (modeline-warning "#754000")
     (modeline-info    "#245370")

     (bg-tab-bar     "#e3e3e3")
     (bg-tab-current "#f5efda")
     (bg-tab-other   "#dcd2b6")

     ;; ----------------------------------------------------------------
     ;; Diffs.
     ;; ----------------------------------------------------------------
     (bg-added           "#d6e4bc")
     (bg-added-faint     "#e5eed3")
     (bg-added-refine    "#bcd79a")
     (bg-added-fringe    "#396127")
     (fg-added           "#2c6123")
     (fg-added-intense   "#396127")
     (bg-removed         "#f0cfc4")
     (bg-removed-faint   "#f7e2db")
     (bg-removed-refine  "#e3ab99")
     (bg-removed-fringe  "#9f452b")
     ;; The red-brown that reads well on the cream page (5.43:1) drops to
     ;; 3.14:1 on its own tinted-red refine background -- deleted lines in
     ;; a refined magit diff.  Darkened (hue held, 98 degrees off the added
     ;; green so it still reads as red) to clear AA on all removed bgs.
     (fg-removed         "#773320")
     (fg-removed-intense "#b82449")
     (bg-changed         "#dbe0ee")
     (bg-changed-faint   "#eaeef7")
     (bg-changed-refine  "#c0c9e6")
     (bg-changed-fringe  "#3a5ca6")
     (fg-changed         "#245370")
     (fg-changed-intense "#074e8d")
     (bg-diff-context    "#eeead6")

     ;; ----------------------------------------------------------------
     ;; Search and parens.  mejelly-light used #ff24b6 (hot magenta) as
     ;; the isearch background, which sits at 2.95:1 -- painful on a
     ;; projector, which is what that theme was for.  A pale tint of the
     ;; same hue carries the dark theme's pink search identity while
     ;; letting the foreground do the work.
     ;; ----------------------------------------------------------------
     (bg-search-current    "#f0d0dd")
     (bg-search-lazy       "#d5d6d1")
     (bg-search-static     "#e6d2bc")
     (bg-search-replace    "#c6b5d3")
     (bg-search-rx-group-0 "#bdc3ca")
     (bg-search-rx-group-1 "#c3c3a8")
     (bg-search-rx-group-2 "#dbbca5")
     (bg-search-rx-group-3 "#c6b5d3")
     (bg-paren-match      "#b9c6d4")
     (bg-paren-expression "#daced6"))
   nil
   modus-themes-operandi-palette
   modus-jellybeans-common-palette-mappings)
  "Full palette for `modus-jellybeans-light'.")

(defcustom modus-jellybeans-light-palette-overrides nil
  "Palette overrides for `modus-jellybeans-light'.
Entries here take precedence over both the theme palette and
`modus-jellybeans-common-palette-overrides'.
See `modus-themes-common-palette-overrides' for the format."
  :group 'modus-jellybeans
  :type '(repeat (list symbol (choice symbol string))))

;;;###theme-autoload
(modus-themes-theme
 'modus-jellybeans-light
 'modus-jellybeans
 "Jellybeans-inspired light palette on modus-operandi."
 'light
 'modus-themes-operandi-palette
 'modus-jellybeans-light-palette
 'modus-jellybeans-light-palette-overrides)

(provide-theme 'modus-jellybeans-light)
;;; modus-jellybeans-light-theme.el ends here
