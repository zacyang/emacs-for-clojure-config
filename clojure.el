;; FOR CLOJURE CONFIGURATION

;; Requires
(require 'rainbow-delimiters)
(require 'company)

;; Hooks
(add-hook 'cider-mode-hook #'eldoc-mode)
(add-hook 'cider-mode-hook #'rainbow-delimiters-mode)
(add-hook 'cider-mode-hook #'paredit-mode)
(add-hook 'cider-repl-mode-hook #'paredit-mode)
(add-hook 'cider-repl-mode-hook #'rainbow-delimiters-mode)
(add-hook 'after-init-hook 'my-replace-symbol)

;; Variables
(setq projectile-indexing-method 'native)
(setq nrepl-log-messages t)
(setq cider-repl-tab-command #'indent-for-tab-command)
(setq cider-prefer-local-resources t)
(setq cider-repl-pop-to-buffer-on-connect t)
(setq cider-stacktrace-fill-column 80)
(setq nrepl-buffer-name-separator "-")
(setq nrepl-buffer-name-show-port t)
(setq cider-prompt-save-file-on-load nil)
(setq cider-repl-result-prefix ";; => ")
(setq cider-interactive-eval-result-prefix ";; => ")
(setq cider-repl-wrap-history t)
(setq cider-repl-history-size 1000) 
(setq cider-repl-history-file "~/.emacs.d/clojure/repl-history")

;; Functions
(defun my-replace-symbol ()
  (dolist (mode '(clojure-mode clojurescript-mode cider-mode))
    (eval-after-load mode
      (font-lock-add-keywords
       mode '(
             ("(\\(fn\\)[\[[:space:]]"  ; anon funcs 1
             (0 (progn (compose-region (match-beginning 1)
                                       (match-end 1) "λ")
                       nil)))
             ("\\(#\\)("                ; anon funcs 2
             (0 (progn (compose-region (match-beginning 1)
                                       (match-end 1) "λ")
                       nil)))
             )))))



