(setq ring-bell-function 'ignore)

;; time-stamps
;; when there's "Time-stamp: <>" in the first 10 lines of the file
(setq
 time-stamp-active t ; do enable time-stamps
 time-stamp-line-limit 10 ; check first 10 buffer lines for Time-stamp: <>
 time-stamp-format "%04y-%02m-%02d %02H:%02M:%02S (%u)") ; date format
(add-hook 'write-file-hooks 'time-stamp) ; update when saving


