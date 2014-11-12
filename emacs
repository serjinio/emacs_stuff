
;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Part common to all OSes
;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; Lisp interpreter settings
(setq max-lisp-eval-depth 18000)
(setq max-specpdl-size 13000)


;; keyboard setup
(set-keyboard-coding-system nil)

(global-set-key (kbd "M-`") 'other-window)
 
; function keys setup
(global-set-key [f1] 'eshell)
(global-set-key [f5] 'eval-region)


;; imenu setup
(global-unset-key [double-mouse-1]) 
(global-set-key [double-mouse-1] 'imenu)


;; remove scrollbars, menus and toolbar
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
;;(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))


;; load-theme
;; (load-theme 'deeper-blue)


;; minor modes & various options
(show-paren-mode t)
(column-number-mode t)
(global-hl-line-mode t) 
(blink-cursor-mode 0)
(icomplete-mode t)

(setq show-paren-style 'expression)
(setq read-buffer-completion-ignore-case 't)
(windmove-default-keybindings) ; Shift-<Arrow keys> switch active window
(setq undo-limit 100000)
(put 'narrow-to-region  'disabled nil)


;; aliases for useful functions

(defalias 'qrr 'query-replace-regexp)
;; useful in eshell for use as a shell command
(defalias 'ff 'find-file)


;; MELPA support
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Settings for different programming languages
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; python-specific stuff
;;;;;;;;;;;;;;;;;;;;;;;;;

;; activate elpy if it is installed
(if (fboundp 'elpy-enable)
    (progn
      (elpy-enable)
      (elpy-use-ipython)))


;;;;;;;;;;;;;;;;;;;;;;
;; Mac specific parts
;;;;;;;;;;;;;;;;;;;;;;


;; correct exec-path necessary when launching Emacs from spotlight
(defun set-exec-path-from-shell-PATH ()
  "Sets the exec-path to the same value used by the user shell"
  (let ((path-from-shell
         (replace-regexp-in-string
          "[[:space:]\n]*$" ""
          (shell-command-to-string "$SHELL -l -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

;; call function now - only for mac
(if (eq system-type 'darwin)
    (set-exec-path-from-shell-PATH))


;; use cmd key for meta on mac
(if (eq system-type 'darwin)
    (setq mac-option-key-is-meta nil
	  mac-command-key-is-meta t
	  mac-command-modifier 'meta
	  mac-option-modifier 'none))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Rest for the custom section
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-safe-themes (quote ("9fa173ced2e7a4d0a8e5aa702701629fa17b52c800391c37ea6678b8e790f7cd" default)))
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Consolas" :foundry "outline" :slant normal :weight normal :height 120 :width normal)))))
