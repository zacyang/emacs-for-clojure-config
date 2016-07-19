(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/"))

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;;add dependecies here, download them if none-exists
(defvar my-packages '(projectile
                      clojure-mode
                      cider
                      paredit
                      company
                      rainbow-delimiters
                      smex
                      magit
                      ))

(dolist (p my-packages)
  (unless (package-installed-p p)
    (package-install p)))

(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))

(load "~/.emacs.d/common.el")

(load "~/.emacs.d/clojure.el")

