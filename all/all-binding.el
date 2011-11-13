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