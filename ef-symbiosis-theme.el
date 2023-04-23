;;; ef-symbiosis-theme.el --- Legible dark theme with blue, green, cyan, gold colors -*- lexical-binding:t -*-

;; Copyright (C) 2022-2023  Free Software Foundation, Inc.

;; Author: Protesilaos Stavrou <info@protesilaos.com>
;; Maintainer: Ef-Themes Development <~protesilaos/ef-themes@lists.sr.ht>
;; URL: https://git.sr.ht/~protesilaos/ef-themes
;; Mailing-List: https://lists.sr.ht/~protesilaos/ef-themes
;; Keywords: faces, theme, accessibility

;; This file is part of GNU Emacs.

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
;; The `ef-themes' are a collection of light and dark themes for GNU
;; Emacs whose goal is to provide colorful ("pretty") yet legible
;; options for users who want something with a bit more flair than the
;; `modus-themes' (also designed by me).

;;; Code:



(eval-and-compile
  (require 'ef-themes)

  (deftheme ef-symbiosis
    "Legible dark theme with blue, magenta, cyan, purple colors.")

  (defconst ef-symbiosis-palette
    '(
;;; Basic values

      (bg-main     "#130911")
      (fg-main     "#d0d0d0")
      (bg-dim      "#221920")
      (fg-dim      "#857f8f")
      (bg-alt      "#372d32")
      (fg-alt      "#89afef")

      (bg-active   "#4b3f47")
      (bg-inactive "#191317")

;;; Basic hues for foreground values

      (red             "#ef6360")
      (red-warmer      "#ff7355")
      (red-cooler      "#fe5a7a")
      (red-faint       "#d56f72")
      (green           "#0faa26")
      (green-warmer    "#6aad0f")
      (green-cooler    "#00a692")
      (green-faint     "#61a06c")
      (yellow          "#bf9032")
      (yellow-warmer   "#d1843f")
      (yellow-cooler   "#df8a5a")
      (yellow-faint    "#cf9f8f")
      (blue            "#3f95f6")
      (blue-warmer     "#6a9fff")
      (blue-cooler     "#029fff")
      (blue-faint      "#7a94df")
      (magenta         "#d369af")
      (magenta-warmer  "#e580ea")
      (magenta-cooler  "#af85ff")
      (magenta-faint   "#c58faf")
      (cyan            "#4fbaef")
      (cyan-warmer     "#6fafff")
      (cyan-cooler     "#1dbfcf")
      (cyan-faint      "#8aa0df")

;;; Basic hues for background values

      (bg-red      "#cd2f30")
      (bg-green    "#20a020")
      (bg-yellow   "#706310")
      (bg-blue     "#2641a0")
      (bg-magenta  "#a050cf")
      (bg-cyan     "#2270be")

      (bg-red-subtle      "#72002a")
      (bg-green-subtle    "#00422a")
      (bg-yellow-subtle   "#603000")
      (bg-blue-subtle     "#242679")
      (bg-magenta-subtle  "#5a105f")
      (bg-cyan-subtle     "#004065")

;;; Diffs

      (bg-added          "#233b0f")
      (bg-added-faint    "#102a00")
      (bg-added-refine   "#2f512f")
      (fg-added          "#a0e0a0")

      (bg-changed        "#363300")
      (bg-changed-faint  "#2a1f00")
      (bg-changed-refine "#4a4a00")
      (fg-changed        "#efef80")

      (bg-removed        "#4e111f")
      (bg-removed-faint  "#380a0f")
      (bg-removed-refine "#751a1f")
      (fg-removed        "#ffbfbf")

;;; Graphs

      (red-graph-0-bg     "#b52c2c")
      (red-graph-1-bg     "#702020")
      (green-graph-0-bg   "#4fd100")
      (green-graph-1-bg   "#007800")
      (yellow-graph-0-bg  "#f1e00a")
      (yellow-graph-1-bg  "#b08600")
      (blue-graph-0-bg    "#2fafef")
      (blue-graph-1-bg    "#1f2f8f")
      (magenta-graph-0-bg "#bf94fe")
      (magenta-graph-1-bg "#5f509f")
      (cyan-graph-0-bg    "#47dfea")
      (cyan-graph-1-bg    "#00808f")

;;; Special hues

      (bg-mode-line       "#583435")
      (fg-mode-line       "#ffe5f0")
      (bg-completion      "#1f334f")
      (bg-hover           "#304477")
      (bg-hover-secondary "#5f3f3a")
      (bg-hl-line         "#1f2f3f")
      (bg-region          "#2f2630")
      (bg-paren           "#005f4a")
      (bg-err             "#360d09") ; check with err
      (bg-warning         "#332600") ; check with warning
      (bg-info            "#002c12") ; check with info

      (border        "#4d484a")
      (cursor        "#f0af7f")
      (fg-intense    "#ffffff")

      (modeline-err     "#ff906f")
      (modeline-warning "#dfcf73")
      (modeline-info    "#7fc82f")

      (underline-err     "#df2f2f")
      (underline-warning "#c0b000")
      (underline-info    "#22b022")

;;; Conditional hues

      (bg-region-intense "#425425")

;;; Mappings

;;;; General mappings

      (err red-warmer)
      (warning yellow)
      (info green)

      (link blue)
      (link-alt green-cooler)
      (name green)
      (keybind yellow-cooler)
      (identifier yellow-faint)
      (prompt cyan)

;;;; Code mappings

      (builtin blue)
      (comment fg-dim)
      (constant cyan-cooler)
      (fnname magenta-cooler)
      (keyword green-warmer)
      (preprocessor red-warmer)
      (docstring yellow-faint)
      (string yellow-cooler)
      (type green-cooler)
      (variable blue-warmer)
      (rx-escape green-cooler) ; compare with `string'
      (rx-construct red)

;;;; Accent mappings

      (accent-0 cyan-warmer)
      (accent-1 yellow-warmer)
      (accent-2 green-warmer)
      (accent-3 magenta-cooler)

;;;; Date mappings

      (date-common green-cooler)
      (date-deadline red-warmer)
      (date-event fg-alt)
      (date-holiday green-cooler)
      (date-now fg-main)
      (date-scheduled yellow)
      (date-weekday yellow-cooler)
      (date-weekend blue)

;;;; Prose mappings

      (prose-code cyan-cooler)
      (prose-done green)
      (prose-macro yellow)
      (prose-metadata fg-dim)
      (prose-metadata-value fg-alt)
      (prose-table fg-alt)
      (prose-tag magenta-faint)
      (prose-todo red)
      (prose-verbatim blue-warmer)

;;;; Mail mappings

      (mail-cite-0 yellow-cooler)
      (mail-cite-1 blue-faint)
      (mail-cite-2 green-faint)
      (mail-cite-3 fg-dim)
      (mail-part cyan)
      (mail-recipient blue-cooler)
      (mail-subject yellow)
      (mail-other blue)

;;;; Rainbow mappings

      (rainbow-0 yellow-cooler)
      (rainbow-1 blue-warmer)
      (rainbow-2 magenta-cooler)
      (rainbow-3 cyan)
      (rainbow-4 magenta)
      (rainbow-5 green-cooler)
      (rainbow-6 red-faint)
      (rainbow-7 yellow)
      (rainbow-8 cyan-warmer))
    "The `ef-symbiosis' palette.
Color values have the form (COLOR-NAME HEX-VALUE) with the former
as a symbol and the latter as a string.

Semantic color mappings have the form (MAPPING-NAME COLOR-NAME)
with both as symbols.  The latter is a color that already exists
in the palette and is associated with a HEX-VALUE.")

  (defvar ef-symbiosis-palette-overrides nil
    "Overrides for `ef-symbiosis-palette'.

Mirror the elements of the aforementioned palette, overriding
their value.

For overrides that are shared across all of the Ef themes,
refer to `ef-themes-common-palette-overrides'.")

  (ef-themes-theme ef-symbiosis ef-symbiosis-palette ef-symbiosis-palette-overrides)

  (provide-theme 'ef-symbiosis))

;;;###theme-autoload
(put 'ef-symbiosis 'theme-properties '(:background-mode dark :kind color-scheme :family ef))

;;; ef-symbiosis-theme.el ends here
