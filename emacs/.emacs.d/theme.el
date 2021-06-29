;; ---------------------------------------------- line
;; source: https://stackoverflow.com/a/18685171/2338672
(set-face-attribute 'hl-line nil :background "#000")
(set-face-attribute 'region nil :background "#000")

;; source: https://stackoverflow.com/a/20233611/2338672
(defun on-after-init ()
  (unless (display-graphic-p (selected-frame))
    (set-face-background 'default "unspecified-bg" (selected-frame))))
(add-hook 'window-setup-hook 'on-after-init)
