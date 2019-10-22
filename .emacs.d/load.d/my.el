(defun my/presentation-theme ()
  "Turn on presentation-friendly theme."
  (interactive)
  (load-theme 'gruvbox-light-hard t)
  (set-frame-font "Hack-21"))

(defun my/normal-theme ()
  "Switch to my default theme."
  (interactive)
  (load-theme 'gruvbox-dark-medium t)
  (set-frame-font "Hack-13"))

(defun my/dayplan ()
  "Open daily plan file."
  (interactive)
  (let* ((week (format-time-string "%V"))
         (file-name (concat "~/orgs/week-" week ".org")))
    (find-file file-name)))

(defun my/goto (place)
  "Navigate to one of my favourite places on this machine."
  (interactive "MLet's go to: ")
  (let* ((week (format-time-string "%V"))
         (places '(("emacs" . "~/.emacs.d/")
                   ("mc" . "~/coding/merchant-center-frontend/")
                   ("dayplan" . (concat "~/orgs/week-" week ".org"))))
        (file-name (eval (alist-get place places nil nil 'equal))))
    (counsel-find-files file-name)))

(global-set-key (kbd "C-c p") 'my/goto)
(my/normal-theme)

;;; my.el ends here
