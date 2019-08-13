(setq my/src-dir "")
(setq my/test-dir "spec/unit/")
(setq my/test-file-ext ".spec.js")

(defun my/switch-to-test ()
  (interactive)
  (let* ((file-full-name (buffer-file-name))
         (file-name (file-name-nondirectory file-full-name))
         (file-dir (file-name-directory file-full-name))
         (project-root (expand-file-name (locate-dominating-file file-dir ".git")))
         (full-src-dir (concat project-root my/src-dir))
         (full-test-dir (concat project-root my/test-dir))
         (test-file-p (and (string-prefix-p full-test-dir file-dir)
                           (string-suffix-p my/test-file-ext file-name)))
         (src-file-p (string-prefix-p full-src-dir file-dir)))
    (cond (test-file-p (my/go-to-sut project-root file-dir file-name))
          (src-file-p  (my/go-to-test project-root file-dir file-name)))))

(defun my/go-to-test (project-root file-dir file-name)
  (let* ((relative-dir (string-remove-prefix my/src-dir
                                             (string-remove-prefix project-root file-dir)))
         (dst-file (concat
                    project-root
                    my/test-dir
                    relative-dir
                    (file-name-sans-extension file-name)
                    my/test-file-ext)))
    (find-file dst-file)))

(defun my/go-to-sut (project-root file-dir file-name)
  (let* ((relative-dir (string-remove-prefix my/test-dir
                                             (string-remove-prefix project-root file-dir)))
         (dst-file (concat
                    project-root
                    my/src-dir
                    relative-dir
                    (string-remove-suffix my/test-file-ext file-name)
                    ".js")))
    (find-file dst-file)))


(global-set-key (kbd "C-c t") 'my/switch-to-test)
