(setq ring-bell-function 'ignore)

;; time-stamps
;; when there's "Time-stamp: <2011-12-30 12:13:46 (Administrator)>" in the first 10 lines of the file
(setq
 time-stamp-active t ; do enable time-stamps
 time-stamp-line-limit 10 ; check first 10 buffer lines for Time-stamp: <>
 time-stamp-format "%04y-%02m-%02d %02H:%02M:%02S (%u)") ; date format
(add-hook 'write-file-hooks 'time-stamp) ; update when saving

;;; locate emacs frame in right of the window
(defun arrange-frame (w h x y)
  "Set the width, height, and x/y position of the current frame"
  (let ((frame (selected-frame)))
    (delete-other-windows)
    (set-frame-position frame x y)
    (set-frame-size frame w h)))

(arrange-frame 80 43 0 0)

(if (eq system-type 'windows-nt)
    (let ((w 80)
          (h 46)
          (x (- (display-pixel-width) (frame-pixel-width) -16)) ;why 16??
          (y 0))
      (message "frmae-pixel now:%d" (frame-pixel-width))
      (arrange-frame w h x y))
  (if (eq system-type 'darwin)
      (let ((w 80)
            (h 43)
            (x (- (display-pixel-width) (frame-pixel-width) 3))
            (y 22))
        (arrange-frame w h x y)))
  )
