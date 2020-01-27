;; connect to emacs
(ql:quickload :swank)
(swank:create-server :port 4005
                     :style swank:*communication-style*
                     :dont-close t)

(stumpwm:mode-line)

;; font
(ql:quickload :clx-truetype)
(load-module "ttf-fonts")
;; in case new font is added:
;; (xft:cache-fonts)
(set-font (make-instance
           'xft:font
           :family "DejaVu Sans Mono"
           :subfamily "Book"
           :size 9))

;; Show battery charge level
(setf stumpwm:*screen-mode-line-format*
      (flet ((battery ()
               (let* ((level (stumpwm:run-shell-command "cat /sys/class/power_supply/BAT0/capacity" t))
                      (level-no-newline (remove #\newline level)))
                 (concatenate 'string "^B☢^b " level-no-newline "%"))))
        (list "[^B%n^b] " `(:eval (funcall ,#'battery)) "%W")))

;; shutdown menu
(load-module "end-session")
(define-key *root-map* (kbd "q") "end-session")
