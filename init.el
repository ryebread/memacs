;; -*- Emacs-Lisp -*- init.el --- Where all the magic begins

;; Copyright (C) 1996-2010 Liubin
;; Time-stamp: <2011-11-20 12:09:33 Sunday by ryebread>

;;  __
;; / /   ()    /7  ()_
;; / /_ /7/7/7/o\ /7/ \/7
;; /__////__//_,'///_n_/

;; This file is NOT part of GNU Emacs.

;; This file is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 2 of
;; the License, or (at your option) any later version.

;; This file is distributed in the hope that it will be
;; useful, but WITHOUT ANY WARRANTY; without even the implied
;; warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
;; PURPOSE.  See the GNU General Public License for more details.

;; You should have received a copy of the GNU General Public
;; License along with this file; if not, write to the Free
;; Software Foundation, Inc., 59 Temple Place - Suite 330, Boston,
;; MA 02111-1307, USA.

;;; Code:

;; uptimes for count
(setq emacs-load-start-time (current-time))

;; Load path etc.
(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))
(add-to-list 'load-path dotfiles-dir)

;;; move frame to right of display(need modify to adapt diffent
;;; dimension and OS
 (setq initial-frame-alist
       '((top . 1) (left . 781) (width . 80) (height . 43)))

;; Load up ELPA, the package manager
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(starter-kit starter-kit-lisp starter-kit-eshell
                                  starter-kit-bindings
                                  color-theme color-theme-twilight
                                  markdown-mode yaml-mode
                                  cygwin-mount
                                  maxframe undo-tree
                                  marmalade oddmuse))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))


;;; add el-get package,use it manager git,svn... packages
(setq el-get-dir (concat dotfiles-dir "el-get"))
(add-to-list 'load-path (concat dotfiles-dir "el-get/el-get" ))
(unless (require 'el-get nil t)
  (url-retrieve
   "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
   (lambda (s)
       (end-of-buffer)
       (eval-print-last-sexp))))

;;; set local sources
(setq el-get-sources
      '((:name smart-mark
               :type git
               :url "https://github.com/brianjcj/smart-mark.git"
               :post-init (lambda () (require 'smart-mark)))
        (:name yasnippet
               :type git
               :url "https://github.com/capitaomorte/yasnippet.git")
        (:name js2-mode
               :type git
               :url "https://github.com/mooz/js2-mode.git"
               :description "An improved JavaScript editing mode"
               :compile "js2-mode.el"
               :post-init (lambda ()
                            (autoload 'js2-mode "js2-mode" nil t)))
        (:name jshint-mode
               :type git
               :url "https://github.com/daleharvey/jshint-mode.git"
               :post-init (lambda ()
                            (require 'flymake-jshint)
                            (add-hook 'javascript-mode-hook
                                      (lambda () (flymake-mode t)))
                            ))
        (:name jade-mode
               :type git
               :url "https://github.com/brianc/jade-mode.git"
               :post-init (lambda ()
                            (require 'sws-mode)
                            (require 'jade-mode)
                            (add-to-list 'auto-mode-alist
                                         '("\\.styl$" . sws-mode))
                            (add-to-list 'auto-mode-alist
                                         '("\\.jade$" . sws-mode))))
        (:name describe-symbol
               :type http
               :url "http://dea.googlecode.com/svn/trunk/my-lisps/describe-symbol.el")
        (:name find-symbol
               :type http
               :url "http://dea.googlecode.com/svn/trunk/my-lisps/find-symbol.el")
        (:name post-command-hook
               :type http
               :url "http://dea.googlecode.com/svn/trunk/my-lisps/post-command-hook.el")
        ))

(setq my-el-packages
      (append
       '(el-get auto-complete textmate goto-last-change twittering-mode
                yasnippet)
       (mapcar 'el-get-source-name el-get-sources)))

(el-get 'sync my-el-packages)

;; You can keep all- user-specific customizations here
(setq system-specific-config (concat dotfiles-dir system-name ".el")
      user-all-config (concat dotfiles-dir  "all.el")
      user-all-dir (concat dotfiles-dir "all")
      user-specific-config (concat dotfiles-dir user-login-name ".el")
      user-specific-dir (concat dotfiles-dir user-login-name))
(add-to-list 'load-path user-specific-dir)
(add-to-list 'load-path user-all-dir)

(if (file-exists-p system-specific-config) (load system-specific-config))
(if (file-exists-p user-all-config) (load user-all-config))
(if (and (not (file-exists-p user-all-config)) (file-exists-p user-all-dir))
    (mapc #'load (directory-files  user-all-dir nil ".*el$")))
(if (file-exists-p user-specific-config) (load user-specific-config))
(if (file-exists-p user-specific-dir)
    (mapc #'load (directory-files user-specific-dir nil ".*el$")))

;;; some package manual setting here
(load  "color-theme-twilight")
(color-theme-twilight)

(setq custom-file (concat dotfiles-dir "custom.el"))
(load custom-file 'noerror)

(message "Emacs startup time: %d seconds."
         (float-time (time-since emacs-load-start-time)))
;;; init.el ends here
(put 'ido-exit-minibuffer 'disabled nil)
