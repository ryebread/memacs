(add-to-list 'auto-mode-alist '("\\.json$" . js2-mode))

(defun js2-execute-buffer ()
  (interactive)
  (shell-command (concat "node " (buffer-file-name))))


(eval-after-load 'js2-mode
  '(progn (define-key js2-mode-map "{" 'paredit-open-curly)
          (define-key js2-mode-map "}" 'paredit-close-curly-and-newline)
          (add-hook 'js2-mode-hook 'esk-paredit-nonlisp)
          ;; fixes problem with pretty function font-lock
          (define-key js2-mode-map (kbd ",") 'self-insert-command)
          (font-lock-add-keywords
           'js2-mode `(("\\(function *\\)("
                        (0 (progn (compose-region (match-beginning 1)
                                                  (match-end 1) "\u0192")
                                  nil)))))))


