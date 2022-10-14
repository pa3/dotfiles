(require 'my-utils)

;;* Arc
;;** `counsel-arc'
(defun counsel-arc-cmd () (concat "(cd " (my/project-root) " && arc ls-files)"))

;;(ivy-set-actions
;; 'counsel-git
;; '(("j" find-file-other-window "other window")
;;   ("x" counsel-find-file-extern "open externally")))

(defun counsel-arc-cands ()
  (split-string
   (shell-command-to-string (counsel-arc-cmd))
   "\n"
   t))

;;;###autoload
(defun counsel-arc (&optional initial-input)
  "Find file in the current Arc repository.
INITIAL-INPUT can be given as the initial minibuffer input."
  (interactive)
  (ivy-read "Find file: " (counsel-arc-cands)
            :initial-input initial-input
            :action #'counsel-arc-action
            :caller 'counsel-arc))

;;(ivy-configure 'counsel-git
;;  :occur #'counsel-git-occur)

(defun counsel-arc-action (x)
  "Find file X in current Git repository."
  (with-ivy-window
    (find-file (concat (my/project-root) "/" x))))

;;(defun counsel-git-occur (&optional _cands)
;;  "Occur function for `counsel-git' using `counsel-cmd-to-dired'."
;;  (cd (ivy-state-directory ivy-last))
;;  (counsel-cmd-to-dired
;;   (counsel--expand-ls
;;    (format "%s | %s | xargs ls"
;;            (replace-regexp-in-string "\\(-0\\)\\|\\(-z\\)" "" counsel-git-cmd)
;;            (counsel--file-name-filter)))))


;;(global-set-key (kbd "C-c g") 'counsel-arc)
