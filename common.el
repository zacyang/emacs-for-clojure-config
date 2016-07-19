;; GENERAL CONFIGURATIONS

;; REQUIRES
(require 'smex)

;; THEMES
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(add-to-list 'load-path "~/.emacs.d/themes")
(load-theme 'zenburn t)

;; GLOBAL MODE
(smex-initialize)
(global-company-mode)
(projectile-global-mode)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; HOOKS
(add-hook 'after-init-hook 'global-company-mode)
(set-default-font "Monaco 16")


