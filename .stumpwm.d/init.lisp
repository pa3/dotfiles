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
           :size 13))
