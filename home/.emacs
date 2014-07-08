
;; Auto indentation for program with curly braces
(load "~/work/elisp/autoloads" 'install)
(add-hook 'c-mode-common-hook '(lambda ()
      (local-set-key (kbd "RET") 'newline-and-indent)))

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

;; Scala Module
(add-to-list 'load-path "/home/khoatran/software/scala/scala-mode2/")
(require 'scala-mode2)

(add-hook 'scala-mode-hook '(lambda ()

  ;; Bind the 'newline-and-indent' command to RET (aka 'enter'). This
  ;; is normally also available as C-j. The 'newline-and-indent'
  ;; command has the following functionality: 1) it removes trailing
  ;; whitespace from the current line, 2) it create a new line, and 3)
  ;; indents it.  An alternative is the
  ;; 'reindent-then-newline-and-indent' command.
  (local-set-key (kbd "RET") 'newline-and-indent)

  ;; Alternatively, bind the 'newline-and-indent' command and
  ;; 'scala-indent:insert-asterisk-on-multiline-comment' to RET in
  ;; order to get indentation and asterisk-insertion within multi-line
  ;; comments.
  ;; (local-set-key (kbd "RET") '(lambda ()
  ;;   (interactive)
  ;;   (newline-and-indent)
  ;;   (scala-indent:insert-asterisk-on-multiline-comment)))

  ;; Bind the 'join-line' command to C-M-j. This command is normally
  ;; bound to M-^ which is hard to access, especially on some European
  ;; keyboards. The 'join-line' command has the effect or joining the
  ;; current line with the previous while fixing whitespace at the
  ;; joint.
  (local-set-key (kbd "C-M-j") 'join-line)

  ;; Bind the backtab (shift tab) to
  ;; 'scala-indent:indent-with-reluctant-strategy command. This is usefull
  ;; when using the 'eager' mode by default and you want to "outdent" a
  ;; code line as a new statement.
  (local-set-key (kbd "<backtab>") 'scala-indent:indent-with-reluctant-strategy)

  ;; and other bindings here
  (require 'whitespace)

  ;; clean-up whitespace at save
  (make-local-variable 'before-save-hook)
  (add-hook 'before-save-hook 'whitespace-cleanup)

  ;; turn on highlight. To configure what is highlighted, customize
  ;; the *whitespace-style* variable. A sane set of things to
  ;; highlight is: face, tabs, trailing
  (whitespace-mode)
))

;; ENSIME, scala enhanced stuff
;; load the ensime lisp code...
(add-to-list 'load-path "/home/khoatran/software/scala/ensime_2.10.0-0.9.8.9/elisp/")
(require 'ensime)

;; This step causes the ensime-mode to be started whenever
;; scala-mode is started for a buffer. You may have to customize this step
;; if you're not using the standard scala mode.
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

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
(load-file "/home/khoatran/software/emacs-for-python/epy-init.el")

;; Auto-reload all buffers on change (e.g. git pull)
(global-auto-revert-mode t)

;; emacs clues theme, https://github.com/emacsfodder
(load-file "/home/khoatran/software/emacs-for-python/clues-theme.el")

;; keybinding for moving between different working windows
(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "C-x <left>") 'windmove-left)

;;; SML. Press f11 to start a new REPL and load the current .sml file into the environment
;;; Credit: Anmol Khirbat (https://class.coursera.org/proglang-002/forum/thread?thread_id=215)
(defun sml-eval-file-in-new-repl ()
  (interactive)
  (if (get-buffer "*sml*")
      (let (kill-buffer-query-functions)
        (kill-buffer "*sml*")))
  (sml-prog-proc-load-file (buffer-file-name) t))

(add-hook
 'sml-mode-hook
 (lambda ()
   (defun sml--read-run-cmd ()
     "Override sml-mode.el so prompting is eliminated."
     (list "sml" "" ""))

   (local-set-key (kbd "<f11>") #'sml-eval-file-in-new-repl)
   (local-set-key (kbd "C-x C-e")
                  (lambda ()
                    (interactive)
                    (let ((current-prefix-arg '(4)))
                      (call-interactively 'sml-send-function))))))

;;; Press C-c C-l to load a new SML repl
;;; Credit: Xuan Bi (https://class.coursera.org/proglang-002/forum/thread?thread_id=682)
(defun isml () 
"If sml repl exists, then restart it else create a new repl."
  (interactive)
  (when (get-buffer "*sml*")
    (with-current-buffer "*sml*"
      (when (process-live-p "sml")
        (comint-send-eof)))
    (sleep-for 0.2))
  (sml-run "sml" ""))

(defadvice sml-prog-proc-load-file 
  (before fresh-sml-repl-then-load-file activate compile) 
  "create a new repl before reload the file." 
  (isml))