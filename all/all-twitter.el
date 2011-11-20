;; -*- Emacs-Lisp -*-

;; Time-stamp: <2010-10-06 13:13:34 Wednesday by ryebread>

(require 'twittering-mode)
;;; network setting
(setq twittering-proxy-use t)
(setq twittering-proxy-server "127.0.0.1")
(setq twittering-proxy-port 8087)
(setq twittering-use-master-password t)

;;; unuse ssl
(setq twittering-allow-insecure-server-cert t)
(setq twittering-oauth-use-ssl nil)
(setq twittering-use-ssl nil)
;;; interface setting
(twittering-enable-unread-status-notifier)  
(setq-default twittering-icon-mode t)

(provide 'all-twitter)
