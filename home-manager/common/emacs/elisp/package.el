; List of packages.
(setq packages '(
		 ;; Theme.
		 kanagawa-theme
		 
		 ;; Status.
		 mood-line
		 
		 ;; Tabs.
		 centaur-tabs

		 ;; General.
		 fzf
		 
		 ;; Development.
		 tree-sitter
		 tree-sitter-langs
		 rainbow-delimiters
		 rainbow-blocks
		 rainbow-mode
	 
		 ;; Languages.
		 nix-mode
		 lua-mode
		 go-mode
		 vala-mode
		 dockerfile-mode
		 rust-mode
		 terraform-mode
	 
		 ;; LSP.
		 lsp-mode
		 lsp-ui
		 company-box
		 
		 ;; Linters.
		 elisp-format
		 elisp-lint
		 golint
		 flymake
		 
		 ;; Misc.
		 which-key
		 ))

;; Package manager.
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(custom-set-variables
 '(package-selected-packages packages))
(custom-set-faces)

; Make sure all packages are installed.
; Source: https://emacs.stackexchange.com/a/28933
(dolist (package packages)
  (unless (package-installed-p package)
    (package-install package))
  (require package))
