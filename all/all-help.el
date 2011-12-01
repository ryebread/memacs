;;; find symbol from ahei
(dolist (map (list emacs-lisp-mode-map lisp-interaction-mode-map
                   completion-list-mode-map help-mode-map))
  (define-key map (kbd "C-c .") 'find-symbol-at-point)
  (define-key map (kbd "C-c ,") 'find-symbol-go-back)
  (define-key map (kbd "C-c V") 'find-symbol-var-at-point)
  (define-key map (kbd "C-c F") 'find-symbol-fun-at-point)
  (define-key map (kbd "C-c S") 'find-symbol-face-at-point))

(define-key global-map (kbd "C-h ,") 'find-symbol)
(define-key global-map (kbd "C-x K") 'find-symbol-fun-on-key)
