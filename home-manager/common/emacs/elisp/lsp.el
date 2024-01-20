(require 'lsp-mode)
(add-hook 'python-mode-hook #'lsp)
(add-hook 'docker-mode-hook #'lsp)
(add-hook 'go-mode-hook #'lsp)
(add-hook 'lua-mode-hook #'lsp)
(add-hook 'nix-mode-hook #'lsp)
(add-hook 'rust-mode-hook #'lsp)
(add-hook 'terraform-mode-hook #'lsp)
(add-hook 'vala-mode-hook #'lsp)

(use-package company-box
  :hook (company-mode . company-box-mode))
