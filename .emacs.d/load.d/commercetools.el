(require 'prettier-js)

(add-hook 'js-mode-hook #'add-node-modules-path)
(add-hook 'js-mode-hook #'prettier-js-mode)
