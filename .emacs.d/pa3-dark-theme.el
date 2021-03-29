;;; pa3-dark-theme.el --- E Ink color theme

;; Inspired by: https://github.com/maio/eink-emacs

;;; Code:

(deftheme pa3-dark
  "My dark theme")

(let* ((palette-dark-red "#cc231d")
       (palette-dark-green "#98971a")
       (palette-dark-yellow "#d79921")
       (palette-dark-orange "#d65d0e")
       (palette-dark-blue "#458588")
       (palette-dark-purple "#b16286")
       (palette-dark-aqua "#689d6a")
       (palette-dark-gray "#928374")

       (palette-red "#fb4934")
       (palette-green "#b8bb26")
       (palette-yellow "#fabd2f")
       (palette-orange "#fe8019")
       (palette-blue "#83a598")
       (palette-purple "#d3869b")
       (palette-aqua "#8ec07c")
       (palette-gray "#a89984")

       (palette-bg0-h "#1d2021")
       (palette-bg0-s "#32302f")
       (palette-bg0  "#282828")
       (palette-bg1 "#3c3836")
       (palette-bg2 "#504945")
       (palette-bg3 "#665c54")
       (palette-bg4 "#7c6f64")
       (palette-bg palette-bg0)

       (palette-fg0 "#fbf1c7")
       (palette-fg1 "#ebdbb2")
       (palette-fg2 "#d5c4a1")
       (palette-fg3 "#bdae93")
       (palette-fg4 "#a89984")
       (palette-fg palette-fg1)

       (fg palette-fg)
       (fg-table palette-fg2)
       (bg palette-bg)
       (bg-light palette-bg2)
       (fg-light palette-fg0)
       (bg-highlight palette-bg1)
       (bg-highlight-2 palette-bg2)
       (bg-highlight-3 palette-bg3))

  (custom-theme-set-faces
   'pa3-dark
   ;; generic stuff
   `(default ((t (:background ,bg :foreground ,fg))))
   `(button ((t (:foreground ,fg :underline t))))
   `(cursor ((t (:background ,fg :foreground ,bg))))
   `(custom-variable-tag ((t (:foreground ,fg :weight bold))))
   `(default-italic ((t (:italic t))))
   `(font-latex-bold-face ((t (:foreground ,fg))))
   `(font-latex-italic-face ((t (:foreground ,fg :slant italic))))
   `(font-latex-match-reference-keywords ((t (:foreground ,fg))))
   `(font-latex-match-variable-keywords ((t (:foreground ,fg))))
   `(font-latex-string-face ((t (:foreground "#a9a9a9"))))
   `(font-lock-builtin-face ((t (:background ,bg :foreground ,fg))))
   `(font-lock-comment-delimiter-face ((t (:foreground ,fg-light))))
   `(font-lock-comment-face ((t (:foreground ,fg-light :weight bold))))
   `(font-lock-constant-face ((t (:foreground ,fg))))
   `(font-lock-doc-face ((t (:foreground ,fg :weight semi-bold))))
   `(font-lock-function-name-face ((t (:foreground ,fg))))
   `(font-lock-keyword-face ((t (:foreground ,fg))))
   `(font-lock-preprocessor-face ((t (:foreground ,fg))))
   `(font-lock-reference-face ((t (:foreground ,fg))))
   `(font-lock-string-face ((t (:foreground ,palette-fg3))))
   `(font-lock-type-face ((t (:foreground ,fg))))
   `(font-lock-variable-name-face ((t (:foreground ,fg :underline nil))))
   `(font-lock-warning-face ((t (:foreground ,fg :weight bold))))
   `(fringe ((t (:background ,bg :foreground ,bg))))
   `(gnus-header-content ((t (:foreground ,fg))))
   `(gnus-header-from ((t (:foreground ,fg))))
   `(gnus-header-name ((t (:foreground ,fg))))
   `(gnus-header-subject ((t (:foreground ,fg))))
   `(highlight ((t nil)))
   `(ido-first-match ((t (:foreground ,fg))))
   `(ido-only-match ((t (:foreground ,fg))))
   `(ido-subdir ((t (:foreground ,fg))))
   `(isearch ((t (:background ,bg-highlight-3 :foreground ,fg))))
   `(link ((t (:foreground ,fg))))
   `(minibuffer-prompt ((t (:foreground ,fg :weight bold))))
   `(mode-line ((t (:background ,fg :foreground ,bg-light :height 0.8))))
   `(mode-line-buffer ((t (:foreground ,bg :background ,fg :weight bold))))
   `(mode-line-inactive ((t (:background ,bg-light :foreground ,fg :height 0.8))))
   `(mode-line-minor-mode ((t (:weight ultra-light :background ,fg :foreground ,bg-light ))))
   `(modeline ((t (:background ,bg :foreground ,fg :height 0.8))))
   `(region ((t (:background ,bg-highlight :foreground ,fg))))
   `(slime-repl-inputed-output-face ((t (:foreground ,fg))))
   `(whitespace-line ((t (:background ,bg-highlight-2 :foreground ,fg))))

   ;; org
   `(org-agenda-date ((t (:foreground ,fg :height 1.2))))
   `(org-agenda-date-today ((t (:foreground ,fg :weight bold :height 1.4))))
   `(org-agenda-date-weekend ((t (:foreground ,fg :weight normal))))
   `(org-agenda-structure ((t (:foreground ,fg :weight bold))))
   `(org-block ((t (:foreground ,fg))))
   `(org-block-begin-line ((t (:foreground ,fg-light :height 0.8))))
   `(org-block-end-line ((t (:foreground ,fg-light :height 0.8))))
   `(org-verbatim ((t (:foreground ,fg :weight semi-bold))))
   `(org-date ((t (:foreground ,fg) :underline)))
   `(org-done ((t (:foreground ,fg-light))))
   `(org-hide ((t (:foreground ,bg))))
   ;; use :overline to give headings more top margin
   `(org-level-1 ((t (:foreground ,fg :weight semi-bold :height 1.3))))
   `(org-level-2 ((t (:foreground ,fg :weight semi-bold :height 1.1 :overline ,bg))))
   `(org-level-3 ((t (:foreground ,fg :weight semi-bold :height 1.1 :overline ,bg))))
   `(org-level-4 ((t (:foreground ,fg :weight semi-bold :height 1.1 :overline ,bg))))
   `(org-level-5 ((t (:foreground ,fg :weight semi-bold :height 1.1 :overline ,bg))))
   `(org-level-6 ((t (:foreground ,fg :weight semi-bold :height 1.1 :overline ,bg))))
   `(org-link ((t (:foreground ,fg :underline t))))
   `(org-quote ((t (:foreground ,fg :slant italic :inherit org-block))))
   `(org-scheduled ((t (:foreground ,fg))))
   `(org-sexp-date ((t (:foreground ,fg))))
   `(org-special-keyword ((t (:foreground ,fg))))
   `(org-todo ((t (:foreground ,fg))))
   `(org-verse ((t (:inherit org-block :slant italic))))
   `(org-table ((t (:foreground ,fg-table))))

   ;; rainbow delimeters
   `(rainbow-delimiters-base-error-face ((t :foreground ,palette-red)))
   `(rainbow-delimiters-depth-1-face ((t :foreground ,palette-dark-orange)))
   `(rainbow-delimiters-depth-2-face ((t :foreground ,palette-dark-aqua)))
   `(rainbow-delimiters-depth-3-face ((t :foreground ,palette-dark-green)))
   `(rainbow-delimiters-depth-4-face ((t :foreground ,palette-dark-yellow)))
   `(rainbow-delimiters-depth-5-face ((t :foreground ,palette-dark-blue)))
   `(rainbow-delimiters-depth-6-face ((t :foreground ,palette-dark-purple)))
   `(rainbow-delimiters-depth-7-face ((t :foreground ,palette-dark-gray)))
   `(rainbow-delimiters-depth-8-face ((t :foreground ,palette-orange)))
   `(rainbow-delimiters-depth-9-face ((t :foreground ,palette-aqua)))

   ;; powerline
   `(powerline-active1 ((t (:background ,palette-bg3 :foreground ,fg :inherit mode-line))))
   `(powerline-active2 ((t (:background ,palette-bg2 :foreground ,fg :inherit mode-line))))

   ;; magit
   `(magit-header ((t (:weight semi-bold))))
   `(magit-item-mark ((t (:background ,bg-highlight))))
   `(magit-item-highlight ((t (:weight bold))))
   `(magit-section-heading ((t (:weight semi-bold :height 1.2))))
   `(magit-section-highlight ((t (:weight semi-bold))))
   `(magit-diff-context-highlight ((t (:foreground ,fg))))
   `(magit-branch-local ((t (:weight bold))))
   `(magit-branch-remote ((t (:weight bold))))

   ;; diff
   `(diff-added ((t (:background ,bg))))
   `(diff-removed ((t (:background ,bg))))
   `(diff-refine-added ((t (:background ,bg))))
   `(diff-refine-removed ((t (:background ,bg))))
   `(magit-diff-added-highlight ((t (:background ,bg-highlight))))
   `(magit-diff-added ((t (:background ,bg))))
   `(magit-diff-removed-highlight ((t (:background ,bg-highlight))))
   `(magit-diff-removed ((t (:background ,bg))))

   ;; git-timemachine
   `(git-timemachine-minibuffer-author-face ((t (:inherit default))))
   `(git-timemachine-minibuffer-detail-face ((t (:weight bold))))

   ;; compile
   `(compilation-error ((t (:inherit error))))

   ;; flycheck
   `(flycheck-error ((t (:foreground ,palette-red))))
   `(flycheck-warning ((t (:foreground ,palette-yellow))))
;;   `(flycheck-error ((t (:inherit error))))
;;   `(flycheck-warning ((t (:inherit warning))))

   ;; dired
   `(dired-directory ((t (:weight bold))))
   `(dired-subtree-depth-1-face ((t (:inherit default))))
   `(dired-subtree-depth-2-face ((t (:inherit default))))
   `(dired-subtree-depth-3-face ((t (:inherit default))))
   `(dired-subtree-depth-4-face ((t (:inherit default))))

   ;; helm
   `(helm-source-header ((t (:foreground ,fg :background "grey90" :weight bold))))
   `(helm-header ((t (:foreground ,fg))))
   `(helm-selection-line ((t (:inherit region :weight bold))))
   `(helm-selection ((t (:background ,bg-highlight))))
   `(helm-ff-directory ((t (:foreground ,fg :weight bold))))
   `(helm-ff-dotted-directory ((t (:foreground ,fg :weight bold))))
   `(helm-ff-symlink ((t (:foreground ,fg :slant italic))))
   `(helm-ff-executable ((t (:foreground ,fg))))

   ;; iedit
   `(iedit-occurrence ((t (:background ,bg-highlight-3 :foreground ,fg))))

   ;; company
   `(company-echo-common ((t (:foreground ,fg))))
   `(company-tooltip-selection ((t (:background ,bg-highlight))))

   ;; parens - parenface
   '(parenface-paren-face ((t (:foreground palette-fg4))))
   '(parenface-curly-face ((t (:foreground palette-fg4))))
   '(parenface-bracket-face ((t (:foreground palette-fg4))))

   ;; parens - paren-face
   `(parenthesis ((t (:foreground ,palette-fg4))))

   ;; parens - other
   `(sp-show-pair-match-face ((t (:foreground "black" :weight bold))))
   `(sp-show-pair-mismatch-face ((t (:background "red" :foreground "black" :weight bold))))
   `(show-paren-match ((t (:foreground "black" :weight bold))))
   `(show-paren-mismatch ((t (:background "red" :foreground "black" :weight bold))))

   ;; js2
   `(js2-function-param ((t (:foreground ,fg))))
   `(js2-external-variable ((t (:foreground ,fg))))

   ;; perl
   `(cperl-hash-face ((t (:foreground ,fg))))
   `(cperl-array-face ((t (:foreground ,fg))))
   `(cperl-nonoverridable-face ((t (:foreground ,fg))))

   ;; rpm-spec-mode
   `(rpm-spec-tag-face ((t (:inherit default))))
   `(rpm-spec-package-face ((t (:inherit default))))
   `(rpm-spec-macro-face ((t (:inherit default))))
   `(rpm-spec-doc-face ((t (:inherit default))))
   `(rpm-spec-var-face ((t (:inherit default))))
   `(rpm-spec-ghost-face ((t (:inherit default))))
   `(rpm-spec-section-face ((t (:inherit default :weight bold))))

   ;; linum / nlinum-relative
   `(nlinum-relative-current-face ((t (:inherit normal :weight bold))))
   `(linum ((t (:inherit normal :weight bold))))

   ;; web-mode
   `(web-mode-current-element-highlight-face ((t (:inherit normal :weight bold :foreground ,fg))))

   ;; mmm-mode
   `(mmm-default-submode-face ((t (:inherit normal :background "#ffffef"))))

   ;; misc
   `(idle-highlight ((t (:background ,bg-highlight))))
   `(yas-field-highlight-face ((t (:background "#eeeee8" :foreground ,fg))))
   `(eshell-prompt ((t (:foreground ,fg :weight bold))))
   `(cider-result-overlay-face ((t (:weight bold))))

   ;; evil-quickscope
   `(evil-quickscope-first-face ((t (:foreground ,fg :background "#eeeee8"))))
   `(evil-quickscope-second-face ((t (:foreground ,fg :background ,bg-highlight-3))))

   ;; evil-snipe
   `(evil-snipe-first-match-face ((t (:foreground ,fg :background "#eeeee8"))))
   `(evil-snipe-matches-face ((t (:foreground ,fg :background ,bg-highlight-3))))

   ;; evil
   `(evil-ex-lazy-highlight ((t (:background ,bg-highlight-2))))
   `(evil-ex-substitute-matches ((t (:background ,bg-highlight-2))))
   `(evil-ex-substitute-replacement ((t (:background ,bg-highlight :underline nil :foreground ,fg))))))

;;;###autoload
(when load-file-name
  (add-to-list
   'custom-theme-load-path
   (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'pa3-dark)
;;; pa3-dark-theme.el ends here
