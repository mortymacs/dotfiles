;; General.
(menu-bar-mode -1)
(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)
(setq message-log-max nil)
(setq confirm-kill-emacs nil)

;; Backup.
(setq make-backup-files nil)
(setq create-lockfiles nil)

;; Status.
(use-package mood-line
  :config
  (mood-line-mode)
  :custom
  (mood-line-glyph-alist mood-line-glyphs-fira-code))

;; Tabs.
(require 'centaur-tabs)
(centaur-tabs-mode t)

;; Treesitter.
(require 'tree-sitter)
(require 'tree-sitter-langs)

;; File manager.
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))