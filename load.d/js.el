(require 'js-comint)

(eval-after-load 'js2-mode
  '(add-hook 'js2-mode-hook #'add-node-modules-path))
(eval-after-load 'js2-jsx-mode
  '(add-hook 'js-mode-hook #'add-node-modules-path))

(global-flycheck-mode)
(flycheck-add-mode 'javascript-eslint 'js2-mode)
(flycheck-add-mode 'javascript-eslint 'js2-jsx-mode)

;; Get eslint executable from current project node_modules top-level folder.
;; Project root is detected by presence of .git folder.

(defun my/use-eslint-from-node-modules ()
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                ".git"))
         (eslint (and root
                      (expand-file-name "node_modules/.bin/eslint"
                                        root))))
    (when (and eslint (file-executable-p eslint))
      (setq-local flycheck-javascript-eslint-executable eslint))))

(add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules)

(make-variable-buffer-local 'js2-ignored-warnings)
(defadvice js2-report-warning (around ignore-some-warnings activate)
  (unless (member (ad-get-arg 0) js2-ignored-warnings)
	ad-do-it))

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-jsx-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . js2-jsx-mode))

(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml\\'" . yaml-mode))


;; Ignore chai assertion
(add-hook 'js2-mode-hook
	  (lambda ()
	    (when (string-match "\\.test\\.js\\'" buffer-file-name)
	      (add-to-list 'js2-ignored-warnings "msg.no.side.effects"))))

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

;; airbnb closing tag
(defadvice js-jsx-indent-line (after js-jsx-indent-line-after-hack activate)
  "Workaround sgml-mode and follow airbnb component style."
  (let* ((cur-line (buffer-substring-no-properties
                    (line-beginning-position)
                    (line-end-position))))
    (if (string-match "^\\( +\\)\/?> *$" cur-line)
      (let* ((empty-spaces (match-string 1 cur-line)))
        (replace-regexp empty-spaces
                        (make-string (- (length empty-spaces) sgml-basic-offset) 32)
                        nil
                        (line-beginning-position) (line-end-position))))))

;;(defun js-jsx-indent-line-align-closing-bracket ()
;;  "Workaround sgml-mode and align closing bracket with opening bracket"
;;  (save-excursion
;;    (beginning-of-line)
;;    (when (looking-at-p "^ +\/?> *$")
;;      (delete-char sgml-basic-offset))))
;;
;;(advice-add #'js-jsx-indent-line :after #'js-jsx-indent-line-align-closing-bracket)


(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))
