(setq-default inhibit-splash-screen t
              inhibit-startup-message t
              inhibit-startup-echo-area-message t
              indent-tabs-mode nil)

(menu-bar-mode -1)
(tool-bar-mode -1)

;; initial window
(setq initial-frame-alist
      '((width . 100) ; character
        (height . 57) ; lines
        ))

;; default/sebsequent windows
(setq default-frame-alist
      '((width . 100) ; character
        (height . 57) ; lines
        ))

;; show line numbers
(global-display-line-numbers-mode t)

(setq require-final-newline t) ; Always add new line to the end of a file

;; Disable backup and auto saving.
(setq auto-save-default nil)
(setq make-backup-files nil)

;; Use Linux style C indentation with 4 space tabs
(setq c-default-style "linux"
      c-basic-offset 2)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/solarized")
(set-frame-parameter nil 'background-mode 'dark)
(set-terminal-parameter nil 'background-mode 'dark)
(load-theme 'solarized t)

(set-frame-font "SF Mono 12" t t)

;; Packages
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package) ; unless it is already installed
  (package-refresh-contents) ; updage packages archive
  (package-install 'use-package)) ; and install the most recent version of use-package

(eval-when-compile
  (require 'use-package))

(use-package ivy :demand
  :ensure t
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t
  ivy-count-format "%d/%d "))

(use-package company
  :ensure t
  :defer t
  :init
  (global-company-mode)
  (company-tng-configure-default)
  :config
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 2))

;; ## added by OPAM user-setup for emacs / base ## 56ab50dc8996d2bb95e7856a6eddb17b ## you can edit, but keep this line
(require 'opam-user-setup "~/.emacs.d/opam-user-setup.el")
;; ## end of OPAM user-setup addition for emacs / base ## keep this line
