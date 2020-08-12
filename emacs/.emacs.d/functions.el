;; ---------------------------------------------- general
(defun display-startup-echo-area-message()
  (message "Hello! :)"))

;; source: https://emacs.stackexchange.com/a/30475/19615
(defun ask-before-closing ()
  "Close only if y was pressed."
  (interactive)
  (if (y-or-n-p (format "Are you sure you want to close this frame? "))
      (save-buffers-kill-emacs)
    (message "Canceled frame close")))

;; ---------------------------------------------- buffers
(defun my-next-buffer ()
  "next-buffer that skips certain buffers"
  (interactive)
  (next-buffer)
  (while (member (buffer-name) skippable-buffers)
    (next-buffer)))

(defun my-previous-buffer ()
  "previous-buffer that skips certain buffers"
  (interactive)
  (previous-buffer)
  (while (member (buffer-name) skippable-buffers)
    (previous-buffer)))

(defun current-file-path ()
  "Show current file path"
  (interactive)
  (message (buffer-file-name)))

;; ---------------------------------------------- windows & pane
(defun toggle-maximize-window ()
  (interactive)
  (if(get 'buffer-maximum-window-mode 'state)
      (progn
	(minimize-window)
	(put 'buffer-maximum-window-mode 'state nil))
    (progn
      (maximize-window)
      (put 'buffer-maximum-window-mode 'state t))))

;; ---------------------------------------------- copy & paste
;; source: https://stackoverflow.com/a/19625063/2338672
(defun copy-to-clipboard ()
  (interactive)
  (if (region-active-p)
      (progn
	(shell-command-on-region (region-beginning) (region-end) "xsel -i -b")
	(message "Yanked region to clipboard!")
	(deactivate-mark))
    (message "No region active; can't yank to clipboard!")))

(defun cut-to-clipboard ()
  (interactive)
  (if (region-active-p)
      (progn
	(shell-command-on-region (region-beginning) (region-end) "xsel -i -b")
	(call-interactively 'clipboard-kill-region)
	(message "Cut region to clipboard!")
	(deactivate-mark))
    (message "No region active; can't yank to clipboard!")))

(defun paste-from-clipboard ()
  (interactive)
  (insert (shell-command-to-string "xsel -o -b")))

;; ---------------------------------------------- neotree
;; source: https://www.reddit.com/r/emacs/comments/9gjb0s/how_to_hide_line_numbers_in_neotrees_buffer/e65ta33/
(defun my/disable-line-numbers (&optional dummy)
  (display-line-numbers-mode -1))
(add-hook 'neo-after-create-hook 'my/disable-line-numbers)

;; ---------------------------------------------- tags
;; create tags
(defun create-tags (dir-name)
  "Create tags file."
  (interactive "DDirectory: ")
  (eshell-command
   (format "find `git rev-parse --show-toplevel` -type f -iname \"*.h\" | etags -" dir-name)))

;; refresh tags
(defun er-refresh-etags (&optional extension)
  "Run etags on all peer files in current dir and reload them silently."
  (interactive)
  (shell-command (format "find `git rev-parse --show-toplevel` -type f -iname \"*.h\" | etags -" '.))
  (let ((tags-revert-without-query t))  ; don't query, revert silently
    (visit-tags-table default-directory nil)))

;; ---------------------------------------------- compile
(defun build-it ()
  (interactive)
  (emamux:run-command "cd `git rev-parse --show-toplevel`/build/ && cmake .. && make -j8"))

(defun test-it ()
  (interactive)
  (emamux:run-command "cd `git rev-parse --show-toplevel`/build/ && make test"))

(defun build-it-exit ()
  (interactive)
  (emamux:close-panes))

(defun rtags-index ()
  (interactive)
  (shell-command (format "[ -d build ] || mkdir `git rev-parse --show-toplevel`/build/"))
  (shell-command (format "cd `git rev-parse --show-toplevel`/build/ && cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 .. && cd .. && rc -J `find . -iname 'compile_commands.json' -exec realpath {} \\;`")))

;; ---------------------------------------------- code
(defun re-indent ()
  (interactive)
  (indent-region (point-min) (point-max)))

;; source: https://emacs.stackexchange.com/a/19084/19615
(defun what-class-im-in ()
  (interactive)
  (save-excursion
    (call-interactively 'move-end-of-line)
    (search-backward-regexp "^\\s-*\\(?:\\(?:abstract\\|final\\)\\s-+\\)?class\\s-+\\(\\(?:\\sw\\|\\\\\\|\\s_\\)+\\)")
    (let ((ret (match-string 1)))
      (message ret)
      ret)))

;; source: https://www.emacswiki.org/emacs/InsertPair
(defun insert-quotations (&optional arg)
  "Enclose following ARG sexps in quotation marks.
Leave point after open-paren."
  (interactive "*P")
  (insert-pair arg ?\' ?\'))

(defun insert-quotes (&optional arg)
  "Enclose following ARG sexps in quotes.
Leave point after open-quote."
  (interactive "*P")
  (insert-pair arg ?\" ?\"))
