(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

;; ---------------------------------------------- general settings
(menu-bar-mode -1)
(set-face-bold 'bold nil)

;; https://stackoverflow.com/a/14511461/2338672
(setq skippable-buffers '("*Messages*" "*scratch*" "*Help*", "*helm occur*"))

;; mode line
(setq-default mode-line-format nil)

;; misc
(delete-selection-mode 1)

;; theme
(load-theme 'monokai t)

;; line settings
(global-hl-line-mode 1)
(global-display-line-numbers-mode 1)
(toggle-truncate-lines -1)

;; ---------------------------------------------- extensions
(setq auto-mode-alist
      (append
       '(("\\.schema\\'" . json-mode))
       auto-mode-alist))

;; ---------------------------------------------- dashboard
(require 'dashboard)
(dashboard-setup-startup-hook)
(setq dashboard-items '((recents  . 5)
                        (projects . 5)
                        (agenda . 5)))

;; ---------------------------------------------- c/c++
;; https://stackoverflow.com/a/663636/2338672
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)
(c-add-style "cc-style"
	     '("google"
	       (c-basic-offset . 2)
	       (c-offsets-alist
		(arglist-close . c-lineup-close-paren))))
(add-hook 'c++-mode-hook
	  (lambda()
	    (c-set-style "cc-style")))

;; https://stackoverflow.com/a/37318957/2338672
(add-hook 'c-mode-common-hook
	  (lambda ()
	    (c-set-offset 'arglist-cont-nonempty '+)))

(setq gud-gdb-command-name (concat "gdb -i=mi " (concat (shell-command-to-string "echo -n `git rev-parse --show-toplevel`") "/build")))

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
			 "\\`CVS/" "\\`#" "\\`.#" "\\`\\.\\./" "\\`\\./"))
(require 'ido-vertical-mode)
(ido-vertical-mode t)
(setq ido-vertical-show-count t)

;; ---------------------------------------------- dump jump (goto)
(setq dumb-jump-quiet t)
(setq dumb-jump-selector 'ivy)
(setq dumb-jump-prefer-searcher 'ag)
(setq dumb-jump-default-project ".")

;; ---------------------------------------------- tabbar
(tabbar-mode)
;; hide tabbar navigation buttons
;; source: https://github.com/dholm/tabbar/issues/27#issuecomment-467308462
(customize-set-variable 'tabbar-scroll-right-button '(("") ""))
(customize-set-variable 'tabbar-scroll-left-button '(("") ""))
(customize-set-variable 'tabbar-buffer-home-button '(("") ""))

;; ---------------------------------------------- projectile
(projectile-mode +1)
(setq projectile-project-search-path '("~/Workspace/plotwise/" "~/Workspace/oss/"))

;; ---------------------------------------------- neotree
(require 'neotree)
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
(require 'helm)
(helm-mode 1)
(setq helm-input-idle-delay 0.2)

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
 '(package-selected-packages
   (quote
    (helm-ag helm-ag-r ido-vertical-mode ag auto-complete-c-headers dashboard cmake-ide atom-one-dark-theme flycheck google-c-style flycheck-clang-tidy zeal-at-point emamux gitignore-mode travis company-irony company-irony-c-headers irony doom-modeline docker ivy zeno-theme flycheck-cython flycheck-mypy smartparens rtags monokai-theme cmake-project cpputils-cmake flymake-cppcheck cmake-mode make-it-so sublimity flycheck-pyflakes kaolin-themes cython-mode git-gutter helm projectile auto-compile evil airline-themes powerline go-mode tabbar makefile-executor farmhouse-theme dracula-theme markdown-mode regex-tool salt-mode json-mode restclient nlinum toml-mode drag-stuff find-file-in-project hungry-delete focus multiple-cursors docker-compose-mode dockerfile-mode rust-mode vala-mode auto-complete dumb-jump magit fill-column-indicator expand-region neotree)))
 '(tabbar-separator (quote (0.5))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil)))))
