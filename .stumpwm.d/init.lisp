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
(swank:create-server)
