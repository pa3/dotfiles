(require 'my-utils)
(require 'prettier-js)

(add-to-list 'auto-mode-alist '("\\.tsx\\'" . typescript-mode))

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (flycheck-add-next-checker 'typescript-tide 'javascript-eslint)
  (add-hook 'flycheck-mode-hook #'my/use-flycheck-executables-from-node-modules)
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

(add-hook 'typescript-mode-hook #'setup-tide-mode)
(add-hook 'typescript-mode-hook #'add-node-modules-path)
(add-hook 'typescript-mode-hook #'prettier-js-mode)

;; CT specific format options
(setq tide-format-options '(:indentSize 2 :tabSize 2))
