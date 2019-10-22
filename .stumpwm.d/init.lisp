;; font
(ql:quickload :clx-truetype)
(load-module "ttf-fonts")
(set-font (make-instance
           'xft:font
           :family "Droid Sans Mono"
           :subfamily "Regular"
           :size 11))

;; connect to emacs
(ql:quickload :swank)
(swank:create-server :port 4005
                     :style swank:*communication-style*
                     :dont-close t)
