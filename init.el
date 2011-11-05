;; -*- Emacs-Lisp -*- init.el --- Where all the magic begins

;; Copyright (C) 1996-2010 Liubin
;; Time-stamp: <2010-10-10 14:31:18 Sunday by ryebread>

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

;; Load up ELPA, the package manager

(add-to-list 'load-path dotfiles-dir)

(setq custom-file (concat dotfiles-dir "custom.el"))

(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(starter-kit starter-kit-lisp starter-kit-eshell
                                  starter-kit-bindings starter-kit-js
                                  color-theme color-theme-twilight
                                  markdown-mode yaml-mode
                                  auto-complete
                                  cygwin-mount
                                  marmalade oddmuse))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; backport some functionality to Emacs 22 if needed
;;(require 'dominating-file)

;; You can keep all- user-specific customizations here
(setq system-specific-config (concat dotfiles-dir system-name ".el")
      user-all-config (concat dotfiles-dir  "all.el")      
      user-all-dir (concat dotfiles-dir "all")
      user-specific-config (concat dotfiles-dir user-login-name ".el")
      user-specific-dir (concat dotfiles-dir user-login-name))
(add-to-list 'load-path (list user-specific-dir user-all-dir))

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


(load custom-file 'noerror)

(message "Emacs startup time: %d seconds."
         (float-time (time-since emacs-load-start-time)))
;;; init.el ends here


