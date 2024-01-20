; Tabs.
(global-set-key (kbd "C-x <prior>")  'centaur-tabs-backward)
(global-set-key (kbd "C-x <next>") 'centaur-tabs-forward)

; LSP.
(setq lsp-keymap-prefix "C-c")
(global-set-key (kbd "C-c d") 'lsp-goto-type-definition)
(global-set-key (kbd "C-c i") 'goto-type-definition)
