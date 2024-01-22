;; Duplicate currne line.
;; Source: https://stackoverflow.com/a/88828
(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank))

;; Move selected lines up or down.
(defun move-selected-lines(target)
  (interactive)
  (let ((selected-start (region-beginning))
        (selected-end   (region-end)))
    (kill-region selected-start selected-end))
  (if (equal target "down")
    (next-line 1)
    (if (equal target "up")
      (previous-line 1)))
  (open-line 1)
  (yank))
