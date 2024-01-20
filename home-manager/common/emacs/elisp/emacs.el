; General.
(menu-bar-mode -1)
(setq inhibit-startup-message nil)
(setq inhibit-splash-screen nil)
(setq confirm-kill-emacs nil)

; Status.
(use-package mood-line
  :config
  (mood-line-mode)
  :custom
  (mood-line-glyph-alist mood-line-glyphs-fira-code))

; Tabs.
(require 'centaur-tabs)
(centaur-tabs-mode t)

; Treesitter.
(require 'tree-sitter)
(require 'tree-sitter-langs)
