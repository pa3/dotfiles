(defun my/project-root ()
  (let ((indicating-files '(".git" "package.json" ".arcadia.root")))
    (or (seq-some #'(lambda (file)
                      (locate-dominating-file default-directory file))
                  indicating-files)
        default-directory)))

;; Get eslint executable from current project node_modules top-level folder.
;; Project root is detected by presence of .git folder.
(defun my/use-flycheck-executables-from-node-modules ()
  (let* ((root (my/project-root))
         (eslint (and root (expand-file-name "node_modules/.bin/eslint" root)))
         (flow (and root (expand-file-name "node_modules/.bin/flow" root))))
    (when (and eslint (file-executable-p eslint))
      (setq-local flycheck-javascript-eslint-executable eslint))
    (when (and flow (file-executable-p flow))
      (setq-local flycheck-javascript-flow-executable flow))))

(provide 'my-utils)
