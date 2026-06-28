;;; ef-themes-legacy-faces.el --- Restore pre-2.0 Ef faces for Org, Magit, Magit Section -*- lexical-binding: t; -*-

;; This file is part of a personal fork of the Ef themes.  It is NOT
;; part of upstream `ef-themes' and is not part of GNU Emacs.

;;; Commentary:
;;
;; Since upstream version 2.0.0 the Ef themes are derived from the
;; Modus themes and no longer define their own faces.  This module
;; restores the pre-2.0 appearance of Org, Magit, and Magit Section
;; buffers by re-applying the historical Ef face definitions on top of
;; the Modus-derived faces whenever an Ef theme is enabled.
;;
;; The face specs below are the verbatim pre-2.0 Ef definitions, with
;; only the mechanical adjustments required by the new architecture:
;;
;; - `ef-themes-fixed-pitch'  -> `modus-themes-fixed-pitch'
;; - `ef-themes-heading-N'    -> `modus-themes-heading-N'
;; - `ef-themes--heading' (a function dropped upstream) is expressed
;;   through the equivalent `modus-themes--heading', which honours the
;;   same `modus-themes-headings' user option.
;; - `ef-themes-key-binding' (a face dropped upstream) is inlined.
;; - the palette names `prose-code', `prose-macro' and `prose-verbatim'
;;   were renamed by Modus to `fg-prose-code', `fg-prose-macro' and
;;   `fg-prose-verbatim'.
;; - the palette name `fg-intense' no longer exists; across every Ef
;;   theme it was pure black on light themes and pure white on dark
;;   themes, so it is rebound here accordingly.
;;
;; The faces are attached to the active Ef theme via
;; `custom-theme-set-faces', so they are removed automatically when the
;; theme is disabled (for example when switching to a non-Ef theme).

;;; Code:

(require 'modus-themes)

;; Defined in `ef-themes', which is loaded before this file.
(defvar ef-themes-items)
(defvar ef-themes-dark-themes)

;; `modus-themes-with-colors' evaluates its body with `eval', outside the
;; surrounding lexical scope, so any value the body needs must reach it
;; through a dynamically bound (special) variable rather than a `let' of
;; an ordinary lexical variable.
(defvar ef-themes-legacy-faces--theme nil
  "The Ef theme whose legacy faces are currently being applied.")

(defvar ef-themes-legacy-faces--fg-intense nil
  "Replacement for the removed `fg-intense' palette color.")

(defun ef-themes-legacy-faces--apply (&optional theme &rest _)
  "Re-apply the pre-2.0 Ef faces for Org, Magit, and Magit Section.
THEME is the theme being enabled, as passed by `enable-theme-functions'.
The faces are applied only when THEME -- or, failing that, the current
theme -- is an Ef theme, and are attached to that theme so that they are
removed when it is disabled."
  (when-let* ((theme (or (car (memq theme ef-themes-items))
                         (car (seq-intersection custom-enabled-themes ef-themes-items)))))
    (let ((ef-themes-legacy-faces--theme theme)
          (ef-themes-legacy-faces--fg-intense
           (if (memq theme ef-themes-dark-themes) "#ffffff" "#000000")))
      (modus-themes-with-colors
        (custom-theme-set-faces
         ef-themes-legacy-faces--theme
;;;; magit (includes the magit-section faces)
    `(magit-bisect-bad ((,c :inherit error)))
    `(magit-bisect-good ((,c :inherit success)))
    `(magit-bisect-skip ((,c :inherit warning)))
    `(magit-blame-date (( )))
    `(magit-blame-dimmed ((,c :inherit shadow)))
    `(magit-blame-hash (( )))
    `(magit-blame-highlight ((,c :background ,bg-active :foreground ,ef-themes-legacy-faces--fg-intense)))
    `(magit-blame-name (( )))
    `(magit-blame-summary ((  )))
    `(magit-branch-local ((,c :foreground ,accent-0)))
    `(magit-branch-remote ((,c :foreground ,accent-1)))
    `(magit-branch-upstream ((,c :inherit italic)))
    `(magit-branch-warning ((,c :inherit warning)))
    `(magit-cherry-equivalent ((,c :foreground ,magenta)))
    `(magit-cherry-unmatched ((,c :foreground ,cyan)))
    `(magit-diff-added ((,c :background ,bg-added-faint :foreground ,fg-added)))
    `(magit-diff-added-highlight ((,c :background ,bg-added :foreground ,fg-added)))
    `(magit-diff-base ((,c :background ,bg-changed-faint :foreground ,fg-changed)))
    `(magit-diff-base-highlight ((,c :background ,bg-changed :foreground ,fg-changed)))
    `(magit-diff-context ((,c :inherit shadow)))
    `(magit-diff-context-highlight ((,c :background ,bg-dim)))
    `(magit-diff-file-heading ((,c :inherit bold :foreground ,accent-0)))
    `(magit-diff-file-heading-highlight ((,c :inherit magit-diff-file-heading :background ,bg-alt)))
    `(magit-diff-file-heading-selection ((,c :inherit bold :background ,bg-hover-secondary :foreground ,ef-themes-legacy-faces--fg-intense)))
    `(magit-diff-hunk-heading ((,c :background ,bg-alt)))
    `(magit-diff-hunk-heading-highlight ((,c :inherit bold :background ,bg-active :foreground ,ef-themes-legacy-faces--fg-intense)))
    `(magit-diff-hunk-heading-selection ((,c :inherit bold :background ,bg-hover-secondary :foreground ,ef-themes-legacy-faces--fg-intense)))
    `(magit-diff-hunk-region ((,c :inherit bold)))
    `(magit-diff-lines-boundary ((,c :background ,ef-themes-legacy-faces--fg-intense)))
    `(magit-diff-lines-heading ((,c :background ,fg-alt :foreground ,bg-alt)))
    `(magit-diff-removed ((,c :background ,bg-removed-faint :foreground ,fg-removed)))
    `(magit-diff-removed-highlight ((,c :background ,bg-removed :foreground ,fg-removed)))
    `(magit-diffstat-added ((,c :inherit success)))
    `(magit-diffstat-removed ((,c :inherit error)))
    `(magit-dimmed ((,c :inherit shadow)))
    `(magit-filename ((,c :foreground ,name)))
    `(magit-hash ((,c :foreground ,identifier)))
    `(magit-head ((,c :inherit magit-branch-local)))
    `(magit-header-line ((,c :inherit bold)))
    `(magit-header-line-key ((,c :inherit (bold modus-themes-fixed-pitch) :foreground ,keybind)))
    `(magit-header-line-log-select ((,c :inherit bold)))
    `(magit-keyword ((,c :foreground ,keyword)))
    `(magit-keyword-squash ((,c :inherit bold :foreground ,warning)))
    `(magit-log-author ((,c :foreground ,name)))
    `(magit-log-date ((,c :foreground ,date-common)))
    `(magit-log-graph ((,c :inherit shadow)))
    `(magit-mode-line-process ((,c :inherit bold :foreground ,modeline-info)))
    `(magit-mode-line-process-error ((,c :inherit bold :foreground ,modeline-err)))
    `(magit-process-ng ((,c :inherit error)))
    `(magit-process-ok ((,c :inherit success)))
    `(magit-reflog-amend ((,c :inherit warning)))
    `(magit-reflog-checkout ((,c :inherit bold :foreground ,blue)))
    `(magit-reflog-cherry-pick ((,c :inherit success)))
    `(magit-reflog-commit ((,c :inherit bold)))
    `(magit-reflog-merge ((,c :inherit success)))
    `(magit-reflog-other ((,c :inherit bold :foreground ,cyan)))
    `(magit-reflog-rebase ((,c :inherit bold :foreground ,magenta)))
    `(magit-reflog-remote ((,c :inherit (bold magit-branch-remote))))
    `(magit-reflog-reset ((,c :inherit error)))
    `(magit-refname ((,c :inherit shadow)))
    `(magit-refname-pullreq ((,c :inherit shadow)))
    `(magit-refname-stash ((,c :inherit shadow)))
    `(magit-refname-wip ((,c :inherit shadow)))
    `(magit-section ((,c :background ,bg-dim :foreground ,fg-main)))
    `(magit-section-heading ((,c :inherit bold)))
    `(magit-section-heading-selection ((,c :inherit bold :background ,bg-hover-secondary :foreground ,ef-themes-legacy-faces--fg-intense)))
    `(magit-section-highlight ((,c :background ,bg-dim)))
    `(magit-sequence-done ((,c :inherit success)))
    `(magit-sequence-drop ((,c :inherit error)))
    `(magit-sequence-exec ((,c :inherit bold :foreground ,magenta)))
    `(magit-sequence-head ((,c :inherit bold :foreground ,cyan)))
    `(magit-sequence-onto ((,c :inherit (bold shadow))))
    `(magit-sequence-part ((,c :inherit warning)))
    `(magit-sequence-pick ((,c :inherit bold)))
    `(magit-sequence-stop ((,c :inherit error)))
    `(magit-signature-bad ((,c :inherit error)))
    `(magit-signature-error ((,c :inherit error)))
    `(magit-signature-expired ((,c :inherit warning)))
    `(magit-signature-expired-key ((,c :foreground ,warning)))
    `(magit-signature-good ((,c :inherit success)))
    `(magit-signature-revoked ((,c :inherit bold :foreground ,warning)))
    `(magit-signature-untrusted ((,c :inherit (bold shadow))))
    `(magit-tag ((,c :foreground ,accent-3))) ; compare with branches
;;;; org
    `(org-agenda-calendar-daterange ((,c :foreground ,date-range)))
    `(org-agenda-calendar-event ((,c :foreground ,date-event)))
    `(org-agenda-calendar-sexp ((,c :inherit (italic org-agenda-calendar-event))))
    `(org-agenda-clocking ((,c :background ,bg-warning :foreground ,warning)))
    `(org-agenda-column-dateline ((,c :background ,bg-alt)))
    `(org-agenda-current-time ((,c :foreground ,date-now)))
    `(org-agenda-date ((,c ,@(modus-themes--heading 'agenda-date date-weekday))))
    `(org-agenda-date-today ((,c :inherit org-agenda-date :underline t)))
    `(org-agenda-date-weekend ((,c :inherit org-agenda-date :foreground ,date-weekend)))
    `(org-agenda-date-weekend-today ((,c :inherit org-agenda-date-today :foreground ,date-weekend)))
    `(org-agenda-diary ((,c :inherit org-agenda-calendar-sexp)))
    `(org-agenda-dimmed-todo-face ((,c :inherit shadow)))
    `(org-agenda-done ((,c :inherit org-done)))
    `(org-agenda-filter-category ((,c :inherit bold :foreground ,modeline-err)))
    `(org-agenda-filter-effort ((,c :inherit bold :foreground ,modeline-err)))
    `(org-agenda-filter-regexp ((,c :inherit bold :foreground ,modeline-err)))
    `(org-agenda-filter-tags ((,c :inherit bold :foreground ,modeline-err)))
    `(org-agenda-restriction-lock ((,c :background ,bg-dim :foreground ,fg-dim)))
    `(org-agenda-structure ((,c ,@(modus-themes--heading 'agenda-structure fg-alt))))
    `(org-agenda-structure-filter ((,c :inherit org-agenda-structure :foreground ,warning)))
    `(org-agenda-structure-secondary ((,c :inherit font-lock-doc-face)))
    `(org-archived ((,c :background ,bg-alt :foreground ,fg-main)))
    `(org-block ((,c :inherit modus-themes-fixed-pitch :background ,bg-inactive :extend t)))
    `(org-block-begin-line ((,c :inherit (shadow modus-themes-fixed-pitch) :background ,bg-dim :extend t)))
    `(org-block-end-line ((,c :inherit org-block-begin-line)))
    `(org-checkbox ((,c :inherit modus-themes-fixed-pitch :foreground ,warning)))
    `(org-checkbox-statistics-done ((,c :inherit org-done)))
    `(org-checkbox-statistics-todo ((,c :inherit org-todo)))
    `(org-clock-overlay ((,c :background ,bg-hover-secondary)))
    `(org-code ((,c :inherit modus-themes-fixed-pitch :foreground ,fg-prose-code)))
    `(org-column ((,c :inherit default :background ,bg-alt)))
    `(org-column-title ((,c :inherit (modus-themes-fixed-pitch bold default) :underline t :background ,bg-alt)))
    `(org-date ((,c :inherit modus-themes-fixed-pitch :foreground ,date-common)))
    `(org-date-selected ((,c :foreground ,date-common :inverse-video t)))
    `(org-dispatcher-highlight ((,c :inherit warning :background ,bg-warning)))
    `(org-document-info ((,c :foreground ,prose-metadata-value)))
    `(org-document-info-keyword ((,c :inherit modus-themes-fixed-pitch :foreground ,prose-metadata)))
    `(org-document-title ((,c :inherit modus-themes-heading-0)))
    `(org-done ((,c :foreground ,prose-done)))
    `(org-drawer ((,c :inherit modus-themes-fixed-pitch :foreground ,prose-metadata)))
    `(org-ellipsis (( ))) ; inherits from the heading's color
    `(org-footnote ((,c :inherit link)))
    `(org-formula ((,c :inherit modus-themes-fixed-pitch :foreground ,prose-table-formula)))
    `(org-headline-done ((,c :inherit org-done)))
    `(org-headline-todo ((,c :inherit org-todo)))
    `(org-hide ((,c :foreground ,bg-main)))
    `(org-indent ((,c :inherit (fixed-pitch org-hide))))
    `(org-imminent-deadline ((,c :inherit bold :foreground ,date-deadline)))
    `(org-latex-and-related ((,c :foreground ,type)))
    `(org-level-1 ((,c :inherit modus-themes-heading-1)))
    `(org-level-2 ((,c :inherit modus-themes-heading-2)))
    `(org-level-3 ((,c :inherit modus-themes-heading-3)))
    `(org-level-4 ((,c :inherit modus-themes-heading-4)))
    `(org-level-5 ((,c :inherit modus-themes-heading-5)))
    `(org-level-6 ((,c :inherit modus-themes-heading-6)))
    `(org-level-7 ((,c :inherit modus-themes-heading-7)))
    `(org-level-8 ((,c :inherit modus-themes-heading-8)))
    `(org-link ((,c :inherit link)))
    `(org-list-dt ((,c :inherit bold)))
    `(org-macro ((,c :inherit modus-themes-fixed-pitch :foreground ,fg-prose-macro)))
    `(org-meta-line ((,c :inherit modus-themes-fixed-pitch :foreground ,prose-metadata)))
    `(org-mode-line-clock (( )))
    `(org-mode-line-clock-overrun ((,c :inherit bold :foreground ,modeline-err)))
    `(org-priority ((,c :foreground ,prose-tag)))
    `(org-property-value ((,c :inherit modus-themes-fixed-pitch :foreground ,prose-metadata-value)))
    `(org-quote ((,c :inherit org-block)))
    `(org-scheduled ((,c :foreground ,date-scheduled-subtle)))
    `(org-scheduled-previously ((,c :inherit (bold org-scheduled-today))))
    `(org-scheduled-today ((,c :foreground ,date-scheduled)))
    `(org-sexp-date ((,c :foreground ,date-common)))
    `(org-special-keyword ((,c :inherit (shadow modus-themes-fixed-pitch))))
    `(org-table ((,c :inherit modus-themes-fixed-pitch :foreground ,prose-table)))
    `(org-table-header ((,c :inherit (bold org-table))))
    `(org-tag ((,c :foreground ,prose-tag)))
    `(org-tag-group ((,c :inherit (bold org-tag))))
    `(org-target ((,c :underline t)))
    `(org-time-grid ((,c :foreground ,fg-dim)))
    `(org-todo ((,c :foreground ,prose-todo)))
    `(org-upcoming-deadline ((,c :foreground ,date-deadline-subtle)))
    `(org-upcoming-distant-deadline ((,c :foreground ,fg-main)))
    `(org-verbatim ((,c :inherit modus-themes-fixed-pitch :foreground ,fg-prose-verbatim)))
    `(org-verse ((,c :inherit org-block)))
    `(org-warning ((,c :inherit warning)))
         )))))

(add-hook 'enable-theme-functions #'ef-themes-legacy-faces--apply)

;; Apply immediately when this file is loaded while an Ef theme is
;; already active (e.g. when required interactively).
(ef-themes-legacy-faces--apply)

(provide 'ef-themes-legacy-faces)
;;; ef-themes-legacy-faces.el ends here
