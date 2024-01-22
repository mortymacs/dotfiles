;; Plugins.
(which-key-mode)

;; Window/Pane.
(global-set-key (kbd "C-x C-h")   'split-window-vertically)
(global-set-key (kbd "C-x C-v")   'split-window-horizontally)
(global-set-key (kbd "C-x C-e")   'kill-this-buffer)
(global-set-key (kbd "C-x C-q")   'delete-window)
(global-set-key (kbd "<M-left>")  'windmove-left)
(global-set-key (kbd "<M-right>") 'windmove-right)
(global-set-key (kbd "<M-up>")    'windmove-up)
(global-set-key (kbd "<M-down>")  'windmove-down)

;; Text.
(global-set-key (kbd "C-d")        'duplicate-line)
(global-set-key (kbd "<M-S-up>")   (lambda () (interactive) (move-selected-lines "up")))
(global-set-key (kbd "<M-S-down>") (lambda () (interactive) (move-selected-lines "down")))

;; Tab.
(global-set-key (kbd "C-x <prior>")  'centaur-tabs-backward)
(global-set-key (kbd "C-x <next>") 'centaur-tabs-forward)

;; LSP.
(setq lsp-keymap-prefix "C-c")
(global-set-key (kbd "C-c d") 'lsp-goto-type-definition)
(global-set-key (kbd "C-c i") 'goto-type-definition)

;; Git.
(global-set-key (kbd "C-x C-f") 'fzf-find-file)

;; File manager.
(global-set-key (kbd "C-\\") 'neotree-toggle)
