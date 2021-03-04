(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))
(package-initialize)
(require 'use-package)

;; ---------------------------------------------- general settings
(menu-bar-mode -1)
(set-face-bold 'bold nil)

;; source: https://stackoverflow.com/a/5795518/2338672
(when (display-graphic-p)
  (progn
    (toggle-scroll-bar -1)
    (tool-bar-mode -1)
    (scroll-bar-mode -1)
    ;; source: https://stackoverflow.com/a/60981985/2338672
    (set-face-attribute 'default nil :font "Hack" :height 130)))

;; source: https://stackoverflow.com/a/14511461/2338672
(setq skippable-buffers '("*Messages*" "*scratch*" "*Help*", "*helm occur*"))

;; misc
(delete-selection-mode 1)

;; theme
(load-theme 'monokai t)

;; line settings
(global-hl-line-mode 1)
(global-display-line-numbers-mode 1)
(toggle-truncate-lines -1)
(require 'multiple-cursors)

;; auto complete
;; source: https://youtu.be/HTUE03LnaXA
;(require 'auto-complete)
;(ac-config-default)

;; ---------------------------------------------- extensions
(setq auto-mode-alist
      (append
       '(("\\.schema\\'" . json-mode) ("\\.rest\\'" . restclient-mode) ("\\.http\\'" . restclient-mode))
       auto-mode-alist))

;; ---------------------------------------------- dashboard
;(require 'dashboard)
;(dashboard-setup-startup-hook)
;(setq dashboard-items '((recents  . 5)
;                        (projects . 5)
;                        (agenda . 5)))

;;---------------------------------------------- ruler
;; source: https://emacs.stackexchange.com/a/14066
;; source: https://emacs.stackexchange.com/a/149
;(defun prog-python-mode ()
;  (setq-default
;   whitespace-line-column 99
;   whitespace-style '(face lines-tail))
;  (require 'py-autopep8)
;  )
;(add-hook 'python-mode-hook #'prog-python-mode)

;; ---------------------------------------------- c/c++
;; source: https://stackoverflow.com/a/663636/2338672
;; coding standard
;(add-hook 'c-mode-common-hook 'google-set-c-style)
;(add-hook 'c-mode-common-hook 'google-make-newline-indent)
;(c-add-style "cc-style"
;	     '("google"
;	       (c-basic-offset . 2)
;	       (c-offsets-alist
;		(arglist-close . c-lineup-close-paren))))
;(add-hook 'c++-mode-hook
;	  (lambda()
;	    (c-set-style "cc-style")))

;; source: https://stackoverflow.com/a/37318957/2338672
;(add-hook 'c-mode-common-hook
;	  (lambda ()
;	    (c-set-offset 'arglist-cont-nonempty '+)))

;; source: https://emacs.stackexchange.com/a/36341/19615
;; lsp & company & irony
;(require 'lsp-mode)
;(add-hook 'c++-mode-hook #'lsp)

;; https://www.reddit.com/r/emacs/comments/bbpicg/any_way_to_disable_these_giant_hovering_info/ekkg7vx/?utm_source=reddit&utm_medium=web2x&context=3
;(setq lsp-ui-doc-enable nil)

;; source: https://youtu.be/XeWZfruRu6k
;(use-package company-lsp
;  :ensure t
;  :config
;  (setq company-idle-delay 0)
;  (setq company-minimum-prefix-length 3))
;(use-package company-irony
;  :ensure t
;  :config
;  (require 'company)
;  (add-to-list 'company-backends 'company-irony))
;(use-package irony
;  :ensure t
;  :config
;  (add-hook 'c++-mode-hook 'irony-mode)
;  (add-hook 'c-mode-hook 'irony-mode)
;  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options))
;(with-eval-after-load 'company
;  (add-hook 'c++-mode-hook 'company-mode)
;  (add-hook 'c-mode-hook 'company-mode))

;; source: https://stackoverflow.com/a/30964293/2338672
;(add-hook 'c++-mode-hook (lambda () (setq flycheck-clang-language-standard "c++17")))

;; rainbow delimiters
;(add-hook 'c++-mode-hook #'rainbow-delimiters-mode)
;(add-hook 'c-mode-hook #'rainbow-delimiters-mode)

;; gdb
(setq gud-gdb-command-name (concat "gdb -i=mi " (concat (shell-command-to-string "echo -n `git rev-parse --show-toplevel`") "/build")))

;; rtags
;(require 'rtags)
;(add-hook 'c-mode-hook 'rtags-start-process-unless-running)
;(add-hook 'c++-mode-hook 'rtags-start-process-unless-running)

;; yasnippet
;(require 'yasnippet)
;(yas-global-mode 1)

;; cmake
;;(cmake-ide-setup)
;;(set 'gc-cons-threshold 100000000)
;; ---------------------------------------------- Go
(require 'lsp-mode)
(add-hook 'go-mode-hook #'lsp-deferred)

;; Set up before-save hooks to format buffer and add/delete imports.
;; Make sure you don't have other gofmt/goimports hooks enabled.
(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

;; ---------------------------------------------- shell
;(use-package flymake-shellcheck
;  :commands flymake-shellcheck-load
;  :init
;  (add-hook 'sh-mode-hook 'flymake-shellcheck-load))

;; ---------------------------------------------- ivy
;(require 'ivy-posframe)
;(setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display)))
;(setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-center)))
;(setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-top-center)))
;(ivy-posframe-mode 1)

;; ---------------------------------------------- ido
(ido-mode t)
(setq ido-enable-flex-matching t)
(setq ido-ignore-extensions t)
(setq ido-show-dot-for-dired nil)
(setq ido-ignore-files '("Makefile"
			 "\\.cmake" "CMakeCache\.txt" "\\.cbp" "CMakeFiles/" "Testing/" "build/"
			 "\\.a" "\\.so"
			 "venv" "\\.pyc" "\\.coverage" "__pycache__"
			 "\\.git/" "\\.github"
			 "\\.bin/" "bin/"
			 "tmp/"
			 "logs/"
			 "\\`CVS/" "\\`#" "\\`.#" "\\`\\.\\./" "\\`\\./"))
;(require 'ido-vertical-mode)
;(ido-vertical-mode t)
;(setq ido-vertical-show-count t)

;; ---------------------------------------------- dump jump (goto)
(setq dumb-jump-quiet t)
(setq dumb-jump-selector 'ivy)
(setq dumb-jump-prefer-searcher 'ag)
(setq dumb-jump-default-project ".")

;; ---------------------------------------------- projectile
(projectile-mode +1)
(setq projectile-project-search-path '("~/Workspace/plotwise/" "~/Workspace/oss/"))
;; source: https://github.com/bbatsov/projectile/issues/184#issuecomment-62940053
(add-to-list 'projectile-globally-ignored-files "*.log")
(add-to-list 'projectile-globally-ignored-files "*.cmake")
(add-to-list 'projectile-globally-ignored-files "*.so")
(add-to-list 'projectile-globally-ignored-files "*.a")
(add-to-list 'projectile-globally-ignored-files "*.pyc")
(add-to-list 'projectile-globally-ignored-directories "*test*")

;; ---------------------------------------------- neotree
(require 'neotree)
(setq neo-theme 'arrow)
(setq neo-hidden-regexp-list '("Makefile"
			       "\\.cmake" "CMakeCache\.txt" "\\.cbp" "CMakeFiles/" "Testing/" "build/"
			       "\\.a" "\\.so"
			       "\\.pyc" "\\.coverage" "__pycache__"
			       "\\.git/" "\\.github"
			       "\\.bin/" "bin/"
			       "tmp/"
			       "\\`CVS/" "\\`#" "\\`.#" "\\`\\.\\./" "\\`\\./"))
(setq neo-window-position (quote left))
(setq neo-window-fixed-size nil)

;; ---------------------------------------------- eshell
(add-hook 'eshell-mode-hook
	  (lambda ()
	    (display-line-numbers-mode -1)))

;; ---------------------------------------------- buffer
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq-default truncate-lines 1)

;; default buffers
(setq inhibit-startup-screen t)
(setq-default message-log-max nil)
(kill-buffer "*Messages*")
(setq initial-scratch-message "")
(kill-buffer "*scratch*")
(add-hook 'minibuffer-exit-hook
	  '(lambda ()
	     (let ((buffer "*Completions*"))
	       (and (get-buffer buffer)
		    (kill-buffer buffer)))))

;; ---------------------------------------------- trim spaces
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq require-final-newline t)
(require 'smartparens-config)

;; ---------------------------------------------- paren
(show-paren-mode 1)

;; ---------------------------------------------- git
(global-git-gutter-mode +1)

;; ---------------------------------------------- drag stuff
(require 'drag-stuff)
(drag-stuff-global-mode 1)

;; ---------------------------------------------- helm config
;(require 'helm)
;(helm-mode 1)
;(setq helm-input-idle-delay 0.2)
;; https://tuhdo.github.io/helm-intro.html
;(helm-autoresize-mode 1)
;; source: https://www.reddit.com/r/emacs/comments/7rho4f/now_you_can_use_helm_with_frames_instead_of/
;(setq helm-display-function 'helm-display-buffer-in-own-frame
;      helm-display-buffer-reuse-frame t
;      helm-use-undecorated-frame-option t)

;; ---------------------------------------------- flycheck
;(global-flycheck-mode)
;; source: https://github.com/flycheck/flycheck/issues/378
;(setq-default flycheck-flake8-maximum-line-length 99)

;; ---------------------------------------------- load files
(load-file "~/.emacs.d/functions.el")
(load-file "~/.emacs.d/keybindings.el")
(load-file "~/.emacs.d/theme.el")

;; ---------------------------------------------- packages
;; we also need to set separator to avoid overlapping tabs by highlighted tabs
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(c-noise-macro-names '("constexpr"))
 '(package-selected-packages
   '(go-tag lsp-mode fzf badwolf-theme highlight-doxygen cpanfile-mode yasnippet gruvbox-theme ein blacken py-autopep8 elpy jenkinsfile-mode auto-package-update flymake-shell flymake-shellcheck rustic flycheck-rust dotenv-mode csv-mode airline-themes vdiff monokai-theme rainbow-delimiters bash-completion company-c-headers company-jedi company-posframe lsp-ui company-lsp lsp-ivy powerline ivy-posframe git-timemachine kubernetes uuidgen dakrone-light-theme helm-ag helm-ag-r ido-vertical-mode ag auto-complete-c-headers dashboard cmake-ide flycheck google-c-style zeal-at-point emamux gitignore-mode travis company-irony company-irony-c-headers irony doom-modeline docker ivy zeno-theme flycheck-cython flycheck-mypy smartparens rtags cmake-project cpputils-cmake flymake-cppcheck cmake-mode make-it-so sublimity flycheck-pyflakes kaolin-themes cython-mode git-gutter helm projectile auto-compile evil go-mode makefile-executor farmhouse-theme markdown-mode regex-tool salt-mode json-mode restclient nlinum toml-mode drag-stuff find-file-in-project hungry-delete focus multiple-cursors docker-compose-mode dockerfile-mode rust-mode vala-mode auto-complete dumb-jump magit fill-column-indicator expand-region neotree)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
