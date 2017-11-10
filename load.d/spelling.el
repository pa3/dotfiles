;; Make ispell use hunspell for spelling
(when (executable-find "hunspell")
  (setq-default ispell-program-name "hunspell")
  (setq-default ispell-extra-args '("-d" "ru_RU"))
  (setq ispell-really-hunspell t))

;; Run ispell on region by C-c s
(global-set-key (kbd "C-c s") 'ispell-region)
