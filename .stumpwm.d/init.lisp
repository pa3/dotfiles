;; Font

(ql:quickload "clx-truetype")
(load-module "ttf-fonts")
(set-font (make-instance
           'xft:font
           :family "Droid Sans Mono"
           :subfamily "Regular"
           :size 11))
