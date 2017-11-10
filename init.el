(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;; Packages auto-installation grabbed from Emacs Prelude
(defvar my-packages
  '(
    add-node-modules-path
    flycheck
    geiser
    helm
    helm-ls-git
    helm-swoop
    js-comint
    js2-mode
    js2-refactor
    load-dir
    markdown-mode
    monokai-theme
    rainbow-delimiters
    restclient
    restclient-helm
    scss-mode
    solarized-theme
    wgrep
    wgrep-helm
    yaml-mode
    ))

(defun my-packages-installed-p ()
  (let (have-uninstalled)
    (dolist (p my-packages)
      (if (not (package-installed-p p)) (setq have-uninstalled t)))
    (not have-uninstalled)))

(unless (my-packages-installed-p)
  (message "%s" "Refreshing its package database...")
  (package-refresh-contents)
  (message "%s" " done.")
  (dolist (p my-packages)
    (when (not (package-installed-p p))
      (package-install p))))

;;; AUTO-ADDED STUFF:

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(backup-by-copying t)
 '(backup-directory-alist (quote (("." . "~/.emacs.d/backup"))))
 '(css-indent-offset 4)
 '(custom-safe-themes
   (quote
    ("3629b62a41f2e5f84006ff14a2247e679745896b5eaa1d5bcfbc904a3441b0cd" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "28130127bbf3072c1bbc7652fca7245f186bb417b3b385a5e4da57b895ffe9d8" "557c283f4f9d461f897b8cac5329f1f39fac785aa684b78949ff329c33f947ec" "c59857e3e950131e0c17c65711f1812d20a54b829115b7c522672ae6ba0864cc" "6c62b1cd715d26eb5aa53843ed9a54fc2b0d7c5e0f5118d4efafa13d7715c56e" default)))
 '(flycheck-temp-prefix "flycheck")
 '(geiser-active-implementations (quote (guile)))
 '(handlebars-basic-offset 2)
 '(helm-ls-git-default-sources
   (quote
    (helm-source-ls-git-status helm-source-ls-git helm-source-ls-git-buffers)))
 '(indent-tabs-mode nil)
 '(ispell-local-dictionary-alist nil)
 '(js-indent-level 4)
 '(js-switch-indent-offset 4)
 '(js2-strict-missing-semi-warning nil)
 '(js2-strict-trailing-comma-warning nil)
 '(load-dirs t)
 '(nxml-child-indent 4)
 '(nxml-outline-child-indent 4)
 '(package-selected-packages
   (quote
    (json-mode wgrep flow-minor-mode add-node-modules-path solarized-theme yaml-mode rainbow-delimiters wgrep-helm scss-mode monokai-theme js2-refactor js-comint helm-swoop helm-ls-git geiser flycheck)))
 '(scss-compile-at-save nil)
 '(sgml-basic-offset 4)
 '(standard-indent 4))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#002b36" :foreground "#839496" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 150 :width normal :foundry "DAMA" :family "Ubuntu Mono")))))
