;;; from http://tychoish.com/rhizome/org-mode-snippets/
(setq org-directory "~/org/")
(setq org-default-notes-file (concat org-directory "/dc.org"))
(setq org-agenda-include-all-todo t)
(setq org-agenda-include-diary t)
(setq org-hide-leading-stars t)
(setq org-odd-levels-only t)
(setq org-todo-keywords 
      '((sequence "TODO(t)" "DOING(i!)" "HANGUP(h!)"
                  "|" "DONE(d!)" "CANCEL(c!)")))

(defvar org-journal-file "~/org/journal.org"  
  "Path to OrgMode journal file.")  
(defvar org-journal-date-format "%Y-%m-%d"  
  "Date format string for journal headings.")  

(defun org-journal-entry ()  
  "Create a new diary entry for today or append to an existing one."  
  (interactive)  
  (switch-to-buffer (find-file org-journal-file))  
  (widen)  
  (let ((today (format-time-string org-journal-date-format)))  
    (beginning-of-buffer)  
    (unless (org-goto-local-search-headings today nil t)  
      ((lambda ()   
         (org-insert-heading)  
         (insert today)  
         (insert "\n\n  \n"))))  
    (beginning-of-buffer)  
    (org-show-entry)  
    (org-narrow-to-subtree)  
    (end-of-buffer)  
    (backward-char 2)  
    (unless (= (current-column) 2)  
      (insert "\n\n  "))))

(require 'remember)
(setq remember-annotation-functions '(org-remember-annotation))
(setq remember-handler-functions '(org-remember-handler))
(add-hook 'remember-mode-hook 'org-remember-apply-template)

(setq org-remember-templates
      '(("todo" ?t "* TODO %?\n  %i\n  %a" "~/org/dc.org" "Tasks")
        ("notes" ?n "* %?\n  %i\n  %a" "~/org/dc.org" "Inbox and Notes")
        ("blog" ?b "* %U %?\n\n  %i\n  %a" "~/org/blog.org")
        ("technology" ?s "* %U %?\n\n  %i\n  %a" "~/org/technology.org")))

(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cm" 'org-remember)
(global-set-key "\C-cj" 'org-journal-entry)
(global-set-key "\C-cb" 'org-iswitchb)
