(global-set-key (kbd "M-w") 'smart-copy)

;; bm(bookmark)bindings
(global-unset-key (kbd "C-1"))
(global-set-key (kbd "C-1 t") 'bm-toggle)
(global-set-key (kbd "C-1 n") 'bm-next)
(global-set-key (kbd "C-1 p") 'bm-previous)

(global-set-key (kbd "C-1 a") 'bm-toggle-cycle-all-buffers)
(global-set-key (kbd "C-1 r") 'bm-bookmark-regexp)
(global-set-key (kbd "C-1 s") 'bm-show-all)
(global-set-key (kbd "C-1 c") 'bm-remove-all-current-buffer)

(global-set-key (kbd "<left-fringe> <mouse-5>") 'bm-next-mouse)
(global-set-key (kbd "<left-fringe> <mouse-4>") 'bm-previous-mouse)
(global-set-key (kbd "<left-fringe> <mouse-1>") 'bm-toggle-mouse)

;; bind find-symbol keys
(dolist
    (map (list emacs-lisp-mode-map lisp-interaction-mode-map
               completion-list-mode-map help-mode-map))
  (define-key map (kbd "C-c .") 'find-symbol-at-point)
  (define-key map (kbd "C-c ,") 'find-symbol-go-back)
  (define-key map (kbd "C-c V") 'find-symbol-var-at-point)
  (define-key map (kbd "C-c F") 'find-symbol-fun-at-point)
  (define-key map (kbd "C-c S") 'find-symbol-face-at-point))
;(define-key global-map (kbd "C-x .") 'find-symbol)
;(define-key global-map (kbd "C-x K") 'find-symbol-fun-on-key)


(global-set-key (kbd "C-x C-k") 'my-clean-buffers) ;delete temp buffers

;; Jump to a definition in the current file. (This is awesome.)
(global-set-key (kbd "M-i") 'my-ido-goto-symbol)

;; Activate occur easily inside isearch
(define-key isearch-mode-map (kbd "C-o")
  (lambda () (interactive)
    (let ((case-fold-search isearch-case-fold-search))
      (occur (if isearch-regexp
                 isearch-string
               (regexp-quote isearch-string))))))

;; cycle through buffers
(global-set-key (kbd "<C-tab>") 'bury-buffer)

(global-set-key "\C-c\C-m" 'smex)
(global-set-key "\M-z" 'my-zap-to-char)

(global-set-key [C-return] 'my-duplicate-line)
(global-set-key (kbd "C-,") 'goto-last-change)
