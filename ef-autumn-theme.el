;;; ef-autumn-theme.el --- Legible dark theme -*- lexical-binding:t -*-

;; Copyright (C) 2022  Free Software Foundation, Inc.

;; Author: Protesilaos Stavrou <info@protesilaos.com>
;; Maintainer: Ef-Themes Development <~protesilaos/ef-themes@lists.sr.ht>
;; URL: https://git.sr.ht/~protesilaos/ef-themes
;; Mailing-List: https://lists.sr.ht/~protesilaos/ef-themes
;; Version: 0.0.0
;; Package-Requires: ((emacs "28.1"))
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
;; Work-in-progress.

;;; Code:



(eval-and-compile
  (require 'ef-themes)

  (deftheme ef-autumn "Legible dark theme.")

  (defconst ef-autumn-palette
    '(;; Basic tones
      (bg-main "#0f0e06") (fg-main "#cfbcba")
      (bg-dim  "#1f1b19") (fg-dim  "#887c8a")
      (bg-alt  "#36322f") (fg-alt  "#70a89f")

      ;; Basic hues for foreground values
      (red             "#ef656a") (green         "#2fa526")
      (red-warmer      "#f26f25") (green-warmer  "#6faf0f")
      (red-cooler      "#f07f7f") (green-cooler  "#00b672")
      (red-faint       "#d08f72") (green-faint   "#61ab78")
      (yellow          "#c48502") (blue          "#379cf6")
      (yellow-warmer   "#e6832f") (blue-warmer   "#6a88ff")
      (yellow-cooler   "#df8f6f") (blue-cooler   "#029fff")
      (yellow-faint    "#cf9f7f") (blue-faint    "#7a94df")
      (magenta         "#d570af") (cyan          "#4fb0cf")
      (magenta-warmer  "#e580ea") (cyan-warmer   "#6fafff")
      (magenta-cooler  "#af8aff") (cyan-cooler   "#3dbbb0")
      (magenta-faint   "#c590af") (cyan-faint    "#92b4df")

      ;; Basic hues for background values
      (bg-red      "#cd2f30") (bg-green  "#20a020")
      (bg-yellow   "#9a4f20") (bg-blue   "#3f43af")
      (bg-magenta  "#c040cf") (bg-cyan   "#027080")

      ;; Diffs
      (bg-added          "#20320f")
      (bg-added-faint    "#102000")
      (bg-added-refine   "#304b1f")

      (bg-changed        "#424200")
      (bg-changed-faint  "#2a2000")
      (bg-changed-refine "#585800")

      (bg-removed        "#501a0a")
      (bg-removed-faint  "#3a1200")
      (bg-removed-refine "#721a16")

      ;; Special hues
      (bg-mode-line  "#692a12") (fg-mode-line  "#feeeca")
      (bg-accent     "#ffa200") (fg-accent     "#000000")
      (bg-completion "#00314f")
      (bg-hover      "#265f4a")
      (bg-hover-alt  "#6f345a")
      (bg-hl-line    "#302a3a")
      (bg-region     "#3f1020")
      (bg-active     "#46423f")
      (bg-paren      "#7f2a40")
      (bg-err        "#361400") ; check with err
      (bg-info       "#152500") ; check with info

      (border        "#54444a")
      (cursor        "#ffaa33")
      (fg-intense    "#ffffff")

      ;; Mappings
      (err red)
      (warning yellow-warmer)
      (info green-warmer)

      (link yellow)
      (link-alt magenta-cooler)
      (date yellow-cooler)
      (name green-warmer)
      (keybind red)

      (builtin red-cooler)
      (comment yellow-faint)
      (constant green-warmer)
      (fnname cyan-cooler)
      (keyword yellow)
      (preprocessor magenta)
      (docstring green-faint)
      (string red-warmer)
      (type green)
      (variable cyan-warmer)

      (accent-0 green-cooler)
      (accent-1 yellow-warmer)
      (accent-2 cyan-cooler)
      (accent-3 magenta-cooler)

      (mail-0 green-warmer)
      (mail-1 red)
      (mail-2 green-cooler)
      (mail-3 yellow-warmer)
      (mail-4 red-cooler)

      (rainbow-0 yellow-warmer)
      (rainbow-1 green-warmer)
      (rainbow-2 magenta)
      (rainbow-3 blue-warmer)
      (rainbow-4 red)
      (rainbow-5 green-cooler)
      (rainbow-6 magenta-warmer)
      (rainbow-7 cyan)
      (rainbow-8 yellow))
    "The `ef-autumn' palette.")

  (ef-themes-theme ef-autumn ef-autumn-palette)

  (provide-theme 'ef-autumn))

;;; ef-autumn-theme.el ends here
