(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(dolist (pkg '(ayu-theme lsp-mode lsp-pyright lsp-ui tree-sitter tree-sitter-indent company git-gutter fzf doom-modeline zig-mode zig-ts-mode git-modes cmake-mode format-all))
  (unless (package-installed-p pkg)
    (package-install pkg)))

;; Body.
(global-display-line-numbers-mode t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(setq make-backup-files nil)
(setq auto-save-default nil)

;; Theme.
(load-theme 'ayu-dark t)
(set-face-background 'default "unspecified-bg")
(require 'doom-modeline)
(doom-modeline-mode 1)

;; Finder.
(use-package fzf
  :bind (("C-x C-f" . fzf)))

;; Git.
(global-git-gutter-mode +1)

;; LSP.
(require 'lsp-mode)
(add-hook 'prog-mode-hook #'lsp)
(use-package lsp-mode
  :hook (prog-mode . lsp)
  :commands lsp
  :config
  (setq lsp-completion-provider :capf))
(require 'lsp-ui)
(add-hook 'lsp-mode-hook #'lsp-ui-mode)
(use-package lsp-ui
  :commands lsp-ui-mode)
(require 'lsp-pyright)

;; Completion.
(require 'company)
(global-company-mode 1)
(global-set-key (kbd "<tab>") #'company-indent-or-complete-common)
(global-set-key (kbd "TAB") #'company-indent-or-complete-common)
(setq company-idle-delay 0.2)
(setq company-minimum-prefix-length 1)

;; Treesitter.
(require 'tree-sitter)
(global-tree-sitter-mode)
(require 'tree-sitter-indent)

;; Formatter.
(use-package format-all
  :ensure t
  :hook (prog-mode . format-all-mode))

;; Keymaps.
(global-set-key (kbd "C-c C-l") #'lsp-format-buffer)

;; Events.
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq require-final-newline t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(ayu-theme cmake-mode company doom-modeline fish-mode format-all fzf
	       git-gutter git-modes lsp-pyright lsp-ui reformatter
	       tree-sitter-indent zig-mode zig-ts-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
