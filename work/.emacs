;; Auto indentation for Python programs
(add-hook 'python-mode-hook '(lambda () 
      (define-key python-mode-map "\C-m" 'newline-and-indent)))

;; Increase emacs font size
(set-face-attribute 'default (selected-frame) :height 140)

;; Turn on parens matching
(show-paren-mode t)

;; Convert tab to space
(setq-default indent-tabs-mode nil)

;; Auto load line numbers
(global-linum-mode)

;; Fix indentation for C and auto-indent
(setq-default c-basic-offset 4)
(setq c-default-style "linux"
          c-basic-offset 4)

(require 'package)
;; Add the original Emacs Lisp Package Archive
(add-to-list 'package-archives
             '("elpa" . "http://tromey.com/elpa/"))

;; Add the user-contributed repository
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))

;; go mode
(setq load-path (cons "/usr/local/go/misc/emacs" load-path))
(require 'go-mode-load)

;; emacs for python, http://gabrielelanaro.github.io/emacs-for-python/
(load-file "/home/t_trank/software/emacs-for-python/epy-init.el")

;; Auto-reload all buffers on change (e.g. git pull)
(global-auto-revert-mode t)

;; emacs clues theme, https://github.com/emacsfodder
(load-file "/home/t_trank/software/clues-theme.el")

;; keybinding for moving between different working windows
(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "C-x <left>") 'windmove-left)

;; Saves buffer on exit
(require 'desktop)
  (desktop-save-mode 1)
  (defun my-desktop-save ()
    (interactive)
    ;; Don't call desktop-save-in-desktop-dir, as it prints a message.
    (if (eq (desktop-owner) (emacs-pid))
        (desktop-save desktop-dirname)))
  (add-hook 'auto-save-hook 'my-desktop-save)

;; Color shell text
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; Auto-complete for Python with Jedi
(add-hook 'python-mode-hook 'auto-complete-mode)
(add-hook 'python-mode-hook 'jedi:ac-setup)

;; Syntax checking Python
(add-hook 'after-init-hook #'global-flycheck-mode)

;; Package manager for Python
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch)
      (goto-char (point-max))
      (eval-print-last-sexp))))
(el-get 'sync)
