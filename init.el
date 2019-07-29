(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
;; (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;; Packages auto-installation grabbed from Emacs Prelude
(defvar my-packages
  '(
    add-node-modules-path
    exec-path-from-shell
    cider
    company
    feature-mode
    flow-minor-mode
    flycheck
    flycheck-flow
    geiser
    graphql-mode
    gruvbox-theme
    helm
    helm-ls-git
    helm-swoop
    js-comint
    load-dir
    markdown-mode
    monokai-theme
    pomodoro
    powerline
    prettier-js
    rainbow-mode
    rainbow-delimiters
    restclient
    restclient-helm
    scss-mode
    twittering-mode
    wgrep
    wgrep-helm
    yaml-mode
    yasnippet
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
 '(css-indent-offset 2)
 '(custom-safe-themes
   (quote
    ("42b9d85321f5a152a6aef0cc8173e701f572175d6711361955ecfb4943fe93af" "021720af46e6e78e2be7875b2b5b05344f4e21fad70d17af7acfd6922386b61e" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "3fa81193ab414a4d54cde427c2662337c2cab5dd4eb17ffff0d90bca97581eb6" "ed0b4fc082715fc1d6a547650752cd8ec76c400ef72eb159543db1770a27caa7" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "8ed752276957903a270c797c4ab52931199806ccd9f0c3bb77f6f4b9e71b9272" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(flycheck-javascript-flow-args nil)
 '(flycheck-temp-prefix "flycheck")
 '(geiser-active-implementations (quote (guile)))
 '(handlebars-basic-offset 2)
 '(helm-ls-git-default-sources
   (quote
    (helm-source-ls-git-status helm-source-ls-git helm-source-ls-git-buffers)))
 '(indent-tabs-mode nil)
 '(ispell-local-dictionary-alist nil)
 '(js-expr-indent-offset 0)
 '(js-indent-level 2)
 '(js-switch-indent-offset 2)
 '(js2-strict-missing-semi-warning nil)
 '(js2-strict-trailing-comma-warning nil)
 '(load-dir-recursive t)
 '(load-dirs t)
 '(nxml-child-indent 4)
 '(nxml-outline-child-indent 4)
 '(package-selected-packages
   (quote
    (pomodoro rainbow-mode color-theme-sanityinc-tomorrow gruvbox-theme json-mode python-mode yaml-mode wgrep-helm wgrep scss-mode restclient-helm restclient rainbow-delimiters monokai-theme markdown-mode load-dir js2-refactor js2-mode js-comint helm-swoop helm-ls-git helm geiser flycheck-flow flycheck flow-minor-mode add-node-modules-path)))
 '(scss-compile-at-save nil)
 '(sgml-basic-offset 2)
 '(standard-indent 4))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 140 :width normal :foundry "nil" :family "Menlo")))))
