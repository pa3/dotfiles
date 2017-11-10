(require 'wgrep)

(blink-cursor-mode -1)
(yas-global-mode 1)
(dired "~/coding/")
(load-theme 'solarized-dark t)

;; HOOKS
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; CUSTOMIZE
(setq tab-width 2)
(setq inhibit-startup-message t)
(setq default-frame-alist '((vertical-scroll-bars . nil)
                            (tool-bar-lines . 0)
                            (menu-bar-lines . 0)
                            (fullscreen . nil)))

;; BINDINGS
;; C-m is not RETURN
(define-key input-decode-map [?\C-m] [C-m])
