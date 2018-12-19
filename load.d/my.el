(defun my/presentation-mode-on ()
  "Turn on presentation-friendly styling."
  (load-theme 'gruvbox-light-hard t)
  (set-frame-font "Menlo-25"))

(defun my/presentation-mode-off ()
  "Turn off presentation-friendly styling."
  (load-theme 'gruvbox-dark-medium t)
  (set-frame-font "Menlo-15"))

(defun my/dayplan ()
  "Open daily plan file."
  (interactive)
  (let* ((week (format-time-string "%V"))
         (file-name (concat "~/orgs/week-" week ".org")))
    (find-file file-name)))

(defun my/goto (place)
  "Navigate to one of my favourite places on this machine."
  (interactive "MLet's go to:")
  (let* ((places '(("emacs" . "~/.emacs.d/")
                  ("mc" . "~/coding/merchant-center-frontend/")))
        (file-name (alist-get place places nil nil 'equal)))
    (helm-find-files-1 file-name)))

(global-set-key (kbd "C-c g") 'my/goto)

;;; my.el ends here
