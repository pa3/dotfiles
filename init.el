(require 'package)
;;(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(global-auto-revert-mode t)

;; Packages auto-installation grabbed from Emacs Prelude
(defvar my-packages
  '(helm helm-ls-git helm-swoop wgrep wgrep-helm monokai-theme js2-mode js-comint js2-refactor markdown-mode))

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


(setq tab-width 4)
(setq inhibit-startup-message t)
(setq default-frame-alist '((vertical-scroll-bars . nil)
                            (tool-bar-lines . 0)
                            (menu-bar-lines . 0)
                            (fullscreen . nil)))
(blink-cursor-mode -1)
(require 'helm-config)
(helm-mode 1)
(add-hook 'after-init-hook (lambda () (load-theme 'monokai)))
(define-key global-map [remap find-file] 'helm-find-files)
(define-key global-map [remap occur] 'helm-occur)
(define-key global-map [remap list-buffers] 'helm-buffers-list)
(define-key global-map [remap dabbrev-expand] 'helm-dabbrev)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-d") 'helm-browse-project)
(unless (boundp 'completion-in-region-function)
  (define-key lisp-interaction-mode-map [remap completion-at-point] 'helm-lisp-completion-at-point)
  (define-key emacs-lisp-mode-map       [remap completion-at-point] 'helm-lisp-completion-at-point))

(add-to-list 'load-path "~/.emacs.d/from-sources/")
(load "handlebars-mode")
(require 'handlebars-mode)

(add-to-list 'auto-mode-alist '("\\.html\\'" . handlebars-mode))

(dired "~/coding/")

;; C-m is not RETURN
(define-key input-decode-map [?\C-m] [C-m])

(make-variable-buffer-local 'js2-ignored-warnings)
(defadvice js2-report-warning (around ignore-some-warnings activate)
  (unless (member (ad-get-arg 0) js2-ignored-warnings)
	ad-do-it))

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . js2-jsx-mode))

;; Ignore chai assertion
(add-hook 'js2-mode-hook
	  (lambda ()
	    (when (string-match "\\.test\\.js\\'" buffer-file-name)
	      (add-to-list 'js2-ignored-warnings "msg.no.side.effects"))))

(require 'js-comint)
(setq inferior-js-program-command "node")
(add-hook 'js2-mode-hook '(lambda () 
			    (local-set-key "\C-x\C-e" 'js-send-last-sexp)
			    (local-set-key "\C-\M-x" 'js-send-last-sexp-and-go)
			    (local-set-key "\C-cb" 'js-send-buffer)
			    (local-set-key "\C-c\C-b" 'js-send-buffer-and-go)
			    (local-set-key "\C-cl" 'js-load-file-and-go)
			    ))
(add-hook 'js2-mode-hook #'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-r")
(setenv "NODE_NO_READLINE" "1")

(require 'wgrep)

(require 'helm-swoop)
(global-set-key (kbd "M-i") 'helm-swoop)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("557c283f4f9d461f897b8cac5329f1f39fac785aa684b78949ff329c33f947ec" "c59857e3e950131e0c17c65711f1812d20a54b829115b7c522672ae6ba0864cc" "6c62b1cd715d26eb5aa53843ed9a54fc2b0d7c5e0f5118d4efafa13d7715c56e" default)))
 '(handlebars-basic-offset 4))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
