;;; add auto-complete support
; Load the default configuration
;(require 'auto-complete-config)
; Make sure we can find the dictionaries
(add-to-list 'ac-dictionary-directories (concat dotfiles-dir "dict"))
; Use ac-source-yasnippet by default
(setq-default ac-sources (add-to-list 'ac-sources 'ac-source-yasnippet))
;(global-auto-complete-mode t)
; Start auto-completion after 2 characters of a word
;(setq ac-auto-start 2)
; case sensitivity is important when finding matches
;(setq ac-ignore-case nil)

;;; support javascript mode
;; (add-to-list 'load-path "/Users/liubin/src/jshint-mode")
;; (require 'flymake-jshint)
;; (add-hook 'javascript-mode-hook
;;           (lambda () (flymake-mode t)))

;;; customize yasnippet
(require 'yasnippet) 
(yas/initialize)
(yas/load-directory (concat dotfiles-dir "snippets"))
(yas/global-mode)

;;; undo-tree
(require 'undo-tree)
(global-undo-tree-mode)

;;; add cygwin support on windows platform
(if (eq system-type 'windows-nt)
    (progn
      (setenv "PATH" (concat (concat  ";") (getenv "PATH")))
      (setq exec-path (cons (concat  "/") exec-path))
      (load-file "all/setup-cygwin.el"))
(progn
  (setenv "PATH" (concat (concat  "/opt/local/bin:/opt/local/sbin:/usr/local/bin:")
                         (getenv "PATH")))
  (setq exec-path (append '("/opt/local/bin" "/opt/local/sbin" "/usr/local/bin")
                          exec-path))))


;; maxframe.el 
(require 'maxframe)
;; (add-hook 'window-setup-hook 'maximize-frame t)

(defvar my-fullscreen-p t "Check if fullscreen is on or off")

(defun my-toggle-fullscreen ()
  (interactive)
  (setq my-fullscreen-p (not my-fullscreen-p))
  (if my-fullscreen-p
      (restore-frame)
    (maximize-frame)))

;; M-return
(global-set-key (kbd "<C-M-return>") 'my-toggle-fullscreen)


;;; turn code folding
(defun my-turn-on-folding ()
  (imenu-add-menubar-index)
  (hs-minor-mode t))

;;; turn on flymake mode
(defun my-turn-on-flymake ()
  (flymake-mode t))

;;(add-hook 'prog-mode-hook 'my-turn-on-folding)

;(load "all-misc")
(load "all-defun")
(load "all-binding")

(load "all-js")


