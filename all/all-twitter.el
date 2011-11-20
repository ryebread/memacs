;; -*- Emacs-Lisp -*-

;; Time-stamp: <2010-10-06 13:13:34 Wednesday by ryebread>

(require 'twittering-mode)
(setq twittering-proxy-use t)
(setq twittering-proxy-server "127.0.0.1")
(setq twittering-proxy-port 8087)

(apply-define-key
 twittering-mode-map
 `(("w"     twittering-follow)
   ("W"     twittering-unfollow)
   ("m"     twittering-favorite)
   ("M"     twittering-unfavorite)))

(provide 'all-twitter)
