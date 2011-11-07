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

;;; customize yasnippet(el-get has alredy init it)
(require 'yasnippet) 
(yas/initialize)
(yas/global-mode t)
(yas/load-directory (concat dotfiles-dir "snippets"))


;;; add cygwin support on windows platform
(if (eq system-name 'windows-nt)
    (progn
      (setenv "PATH" (concat (concat  ";") (getenv "PATH")))
      (setq exec-path (cons (concat  "/") exec-path))
      (load-file "all/setup-cygwin.el"))
(progn
  (setenv "PATH" (concat (concat  "/opt/local/bin:/opt/local/sbin:/usr/local/bin:")
                         (getenv "PATH")))
  (setq exec-path (append '("/opt/local/bin" "/opt/local/sbin" "/usr/local/bin")
                          exec-path))))
