(defun my/presentation-theme ()
  "Turn on presentation-friendly theme."
  (interactive)
  (load-theme 'gruvbox-light-hard t)
  (set-frame-font "Hack-21"))

(defun my/light-theme ()
  "Switch to my light theme."
  (interactive)
  (load-theme 'eink t)
  (set-frame-font "Hack-13"))

(defun my/dark-theme ()
  "Switch to my dark theme."
  (interactive)
  (load-theme 'pa3-dark t)
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

(defun my/short-hash (str &optional len)
  "Make length limited hash of a string. Default len value is 6."
  (let* ((hash (sha1 str))
         (hash-len (length hash))
         (result-len (or len 6)))
    (substring hash
               0
               (min hash-len result-len))))

(defun my/mount-arcadia ()
  (interactive)
  (shell-command "arc mount ~/arcadia"))

(global-set-key (kbd "C-c p") 'my/goto)
(my/light-theme)

;;; my.el ends here
