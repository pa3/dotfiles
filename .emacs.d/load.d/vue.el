(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))
(flycheck-add-mode 'javascript-eslint 'web-mode)
