;; BASIC

;; packaging
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; custom file
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; no...
(setq make-backup-files nil)
(setq auto-save-default nil)
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(blink-cursor-mode 0)

;; time
(setq display-time-default-load-average nil)
(display-time-mode t)

;; show matching parens
(show-paren-mode t)

;; activate on programming modes
(add-hook 'prog-mode-hook
          ;; display line numbers mode
          'display-line-numbers-mode)

;; interactively do things with buffers and files
(require 'ido)
(ido-mode t)

;; emacs server
(server-start)

;; activate on text modes
(add-hook 'text-mode-hook
          (lambda ()
            ;; variable-pitch-mode
            (variable-pitch-mode t)
            ;; centers text in the buffer
            (olivetti-mode t)))

;; org-bullets
(require 'org-bullets)
(setq org-bullets-bullet-list
      '("◉" "○"))
(add-hook 'org-mode-hook 'org-bullets-mode)

;; fonts
(set-face-attribute 'default nil :family "Fantasque Sans Mono" :height 120)
(set-face-attribute 'fixed-pitch nil :family "Fantasque Sans Mono")
(set-face-attribute 'variable-pitch nil :family "Linux Libertine")

;; theme
(require 'poet-theme)
(load-theme 'poet-dark t)

;; avy
(require 'avy)
(global-set-key (kbd "C-'") 'avy-goto-char-2)

;; which-key
(require 'which-key)
(which-key-mode)


;; EXWM

;; load exwm
(require 'exwm)

;; fix problems with ido
(require 'exwm-config)
(exwm-config-ido)

;; system tray
(require 'exwm-systemtray)
(exwm-systemtray-enable)

;; set the initial number of workspaces
(setq exwm-workspace-number 4)

;; make class name the buffer name
(add-hook 'exwm-update-class-hook
          (lambda ()
            (exwm-workspace-rename-buffer exwm-class-name)))

;; global key bindings
(setq exwm-input-global-keys
      `(
        ;; bind "s-r" to exit char-mode and fullscreen mode
        ([?\s-r] . exwm-reset)
        ;; bind "s-w" to switch workspace interactively
        ([?\s-w] . exwm-workspace-switch)
        ;; bind "s-0" to "s-9" to switch to a workspace by its index
        ,@(mapcar (lambda (i)
                    `(,(kbd (format "s-%d" i)) .
                      (lambda ()
                        (interactive)
                        (exwm-workspace-switch-create ,i))))
                  (number-sequence 0 9))
        ;; bind "s-&" to launch applications
        ([?\s-&] . (lambda (command)
                     (interactive (list (read-shell-command "$ ")))
                     (start-process-shell-command command nil command)))
        ;; bind "s-<f2>" to "slock", a simple x display locker
        ([s-f2] . (lambda ()
                    (interactive)
                    (start-process "" nil "/usr/bin/slock")))))

;; local key bindings
;; bind "c-q" to send key
(define-key exwm-mode-map [?\C-q] #'exwm-input-send-next-key)

;; mimic the behavior of emacs
(setq exwm-input-simulation-keys
      '(
        ;; movement
        ([?\C-b] . [left])
        ([?\M-b] . [C-left])
        ([?\C-f] . [right])
        ([?\M-f] . [C-right])
        ([?\C-p] . [up])
        ([?\C-n] . [down])
        ([?\C-a] . [home])
        ([?\C-e] . [end])
        ([?\M-v] . [prior])
        ([?\C-v] . [next])
        ([?\C-d] . [delete])
        ([?\C-k] . [S-end delete])
        ;; cut/paste.
        ([?\C-w] . [?\C-x])
        ([?\M-w] . [?\C-c])
        ([?\C-y] . [?\C-v])
        ;; search
        ([?\C-s] . [?\C-f])))

;; enable exwm
(exwm-enable)


;; desktop-environment
(require 'desktop-environment)
(desktop-environment-mode)
