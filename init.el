(require 'package)

(setq-default inhibit-splash-screen t
              inhibit-startup-message t
              inhibit-startup-echo-area-message t
              indent-tabs-mode nil
              )

(menu-bar-mode -1)
(tool-bar-mode -1)

;; initial window
(setq initial-frame-alist
      '(
        (width . 100) ; character
        (height . 57) ; lines
        ))

;; default/sebsequent window
(setq default-frame-alist
      '(
        (width . 100) ; character
        (height . 57) ; lines
        ))

(global-hl-line-mode t)
(global-linum-mode t)

(setq require-final-newline t) ; Always add new line to the end of a file

;; Disable backup and auto saving.
(setq auto-save-default nil)
(setq make-backup-files nil)

(setq package-enable-at-startup nil) ; tells emacs not to load any packages before starting up
;; the following lines tell emacs where on the internet to look up
;; for new packages.
(setq package-archives '(("org"       . "http://orgmode.org/elpa/")
                         ("gnu"       . "http://elpa.gnu.org/packages/")
                         ("melpa"     . "https://melpa.org/packages/")
                         ))
(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package) ; unless it is already installed
  (package-refresh-contents) ; updage packages archive
  (package-install 'use-package)) ; and install the most recent version of use-package

(eval-when-compile
  (require 'use-package))

(use-package evil
  :ensure t
  :config (evil-mode t)
  ;; Use j and k as gj and jk
  (define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
  (define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)
  ;; Better split navigation, default is C-w + [h / j / k / l]
  (define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
  (define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
  (define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
  (define-key evil-normal-state-map (kbd "C-l") 'evil-window-right))

(use-package evil-escape
  :ensure t
  :config
  (evil-escape-mode t)
  (setq-default evil-escape-key-sequence "jk"))

(use-package company               
  :ensure t
  :defer t
  :init (global-company-mode))

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/solarized")
(set-frame-parameter nil 'background-mode 'dark)
(set-terminal-parameter nil 'background-mode 'dark)
(load-theme 'solarized t)

(set-frame-font "Source Code Pro 14" t t)

(use-package lua-mode
  :ensure t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (evil use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
