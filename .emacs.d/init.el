(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
;; (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(load "~/.emacs.d/load.d/utils.el")

;; Packages auto-installation grabbed from Emacs Prelude
(defvar my-packages
  '(
    add-node-modules-path
    exec-path-from-shell
    cider
    company
    counsel
    eink-theme
    feature-mode
    flow-minor-mode
    flycheck
    flycheck-flow
    geiser
    graphql-mode
    gruvbox-theme
    ivy
    js-comint
    load-dir
    magit
    markdown-mode
    monokai-theme
    org-roam
    paren-face
    pomodoro
    powerline
    prettier-js
    rainbow-mode
    rainbow-delimiters
    restclient
    restclient-helm
    scss-mode
    slime
    tide
    twittering-mode
    web-mode
    wgrep
    yaml-mode
    yasnippet
    ))

(defun my-packages-installed-p ()
  (let (have-uninstalled)
    (dolist (p my-packages)
      (if (not (package-installed-p p)) (setq have-uninstalled t)))
    (not have-uninstalled)))

(unless (my-packages-installed-p)
  (message "%s" "Refreshing its package database...")
  (package-refresh-contents)
  (message "%s" " done.")
  (dolist (p my-packages)
    (when (not (package-installed-p p))
      (package-install p))))

;;; AUTO-ADDED STUFF:

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(backup-by-copying t)
 '(backup-directory-alist '(("." . "~/.emacs.d/backup")))
 '(blink-matching-paren nil)
 '(css-indent-offset 2)
 '(custom-safe-themes
   '("021321ae56a45794f43b41de09fb2bfca184e196666b7d7ff59ea97ec2114559" "59bcfdf366248cf3874b4e4fa9488b1d9bbee7262fdb43f96d368bc986f76654" "a3517166d4503f78c10d33652c2515ac5981400cd02e62b5f328e5da09d2fcba" "1a2abbedff93377cc02475f2598e87c624b828c33c4cf069265b0bf9274fe953" "870186a09d4944e5a248977983fdb0892b690057937efd2dee1b8a930a6fef63" "7d381264cb2d9b86a935b5f91d4e45530334c8eca35247d15b3f2cfbd3b6a7d5" "54b8a76c1ef049f45ecdb3cda0199355c4777b0c43350375fc6d8910fe1bdee9" "c04d810f5f724ae5ea1c3e6d8518ee0ca128d3b623ad20e506d16bbd6cf0d5a0" "22ae3f02137d56c713647c28e69ead981ac9cd9bc749160d2df8aa0bfd37cf15" "d57f12fc57fe959f0fa7c7923e36fe88d59f3bcadd591107c3c808cfd67e8910" "a722ca67bcb2b74fbc29c35e5cd4c5a249a26a31264481ba4e66bedca0faa7e1" "a0b88513f0e8ffe1aa72bdec9d943f76f9ef46d731aef910456532bfbbe293f6" "a2bd3a69e26eae3a184791d0ed7e328ee454a6a2afe03d55dd5e84f01f1c6926" "d4d619dfcae1a42015ba3189b15e0266d8f643e827300d1f0e08424fe1379ae9" "96a117ede3690ff1d6a8ef9ea067fb8d40ad4b01d8eba2037998edeab9283b5f" "77199b06c77fef095719acd4cc163a66a57e6087944d5c6175542b58a16201be" "bdda76aac239859eb6579b3589880ca1c44fe25fc13aeeb33686dd2e594e2aab" "610071bd3dcb34fb6fa8a62082d3da6a18bd01435596e2b07380336e50634cea" "3ddad0692a3d82709ef00ec7c5555353822c07a63d303414abf8af7c116bd8c9" "2cad8df76f222887d7d8cdaeb3cd486d46122ae67a2e83da7cbe010cbcbd6869" "3e6e02908c18ef38f3e552e8dd445bb33813e6247f0a2d5cb948b0cfaee690e9" "863c414705073d963f0a3ecd87d521f5384f9af557e5e2e08890a0c687466443" "597e2ea589a0aca8ac3ff30abc4f6fb01feb83fa7aea13dc9667909320b7d36d" "897f1c53a92369b1650bfbca58844467c79b441ab53211c3da0cfc092483b90e" "50ddda38b75c888209d2be97da6c64833811088d2dc2b6a8d1795c4b3cbeab7d" "96d2b506860144504fb0daf5d6641468d442bfbf3b0b00fbdb02683d26ff9975" "994ff04854478ed487a623053bde3d30105a93b131db55c78ea59e366fd2abef" "c499057d06403d43d8323133f85c02ece77adc2e891dbde8e1ffde02bd680e24" "f0d8667f56537cd4cc312fecc8283576cdbc660b4a94449bdfbab8c6b89480b9" "6b7b9cd16ca4d4469f386ed96473b15186284a57ad666e1e20a734f434f78091" "58fe427944cc2b8c95f86755fbea23f5574130301426775a2decdba57a07838e" "db49b145306b70514a889e866595b7d7c5840642a718d14a447a35b2b3dd266f" "64d2797f1887dce4d02a9fdc9e8c1c033e751bad2cd5836a14f23035a11f4067" "2c8f570b9d10054aa70867b0ca34f64d0055a7488af782ed51eed30cb54ff6a2" "a06658a45f043cd95549d6845454ad1c1d6e24a99271676ae56157619952394a" "a3851cfbaceb471a94ab8155d7252c8bff96f8646ad02f54efe8c7411c74cae3" "939ea070fb0141cd035608b2baabc4bd50d8ecc86af8528df9d41f4d83664c6a" "4cf9ed30ea575fb0ca3cff6ef34b1b87192965245776afa9e9e20c17d115f3fb" "aded61687237d1dff6325edb492bde536f40b048eab7246c61d5c6643c696b7f" "e1d09f1b2afc2fed6feb1d672be5ec6ae61f84e058cb757689edb669be926896" "48551aa4b2d8b723dc92523806ad3fe01247604147211ad8493c9883f05873ee" "42b9d85321f5a152a6aef0cc8173e701f572175d6711361955ecfb4943fe93af" "021720af46e6e78e2be7875b2b5b05344f4e21fad70d17af7acfd6922386b61e" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "3fa81193ab414a4d54cde427c2662337c2cab5dd4eb17ffff0d90bca97581eb6" "ed0b4fc082715fc1d6a547650752cd8ec76c400ef72eb159543db1770a27caa7" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "8ed752276957903a270c797c4ab52931199806ccd9f0c3bb77f6f4b9e71b9272" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default))
 '(flycheck-javascript-flow-args nil)
 '(flycheck-temp-prefix "flycheck")
 '(geiser-active-implementations '(guile))
 '(handlebars-basic-offset 2)
 '(helm-ls-git-default-sources
   '(helm-source-ls-git-status helm-source-ls-git helm-source-ls-git-buffers))
 '(indent-tabs-mode nil)
 '(ispell-local-dictionary-alist nil)
 '(js-expr-indent-offset 0)
 '(js-indent-level 2)
 '(js-switch-indent-offset 2)
 '(js2-strict-missing-semi-warning nil)
 '(js2-strict-trailing-comma-warning nil)
 '(load-dir-recursive t)
 '(load-dirs t)
 '(nxml-child-indent 4)
 '(nxml-outline-child-indent 4)
 '(package-selected-packages
   '(paren-face pomodoro rainbow-mode color-theme-sanityinc-tomorrow gruvbox-theme json-mode python-mode yaml-mode wgrep-helm wgrep scss-mode restclient-helm restclient rainbow-delimiters monokai-theme markdown-mode load-dir js2-refactor js2-mode js-comint helm-swoop helm geiser flycheck-flow flycheck flow-minor-mode add-node-modules-path))
 '(scss-compile-at-save nil)
 '(sgml-basic-offset 2)
 '(show-paren-mode t)
 '(standard-indent 4)
 '(typescript-indent-level 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
