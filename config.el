;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Christina Van Heer"
      user-mail-address "christinavanheer@gmail.com")

;; Copy the paths from your shell - I am using catalina so using zshrc / zsh environment
(exec-path-from-shell-initialize ) ;; make sure this is done in .zshrc
                                  ;; export PATH=/Library/TeX/texbin:${PATH}  - should be last in your file I think
                                  ;; export PATH=/usr/local/bin:/usr/bin:/bin

(setq ‘exec-path-from-shell-check-startup-files’ :disable)


;(exec-path-from-shell-check-startup-files nil)
;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "Consolas" :size 11))
(setq doom-variable-pitch-font (font-spec :family "Consolas" :size 11))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;(setq doom-theme 'doom-vibrant)
;(setq doom-theme 'doom-acario-light)
;(setq doom-theme 'doom-fairy-floss)
(setq doom-theme 'doom-nova)
;(setq doom-theme 'doom-spacegrey)
;(setq doom-theme 'doom-wilmersdorf)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
;(setq org-directory "~/pCloud Drive/ORGMODE_GTD/")

;; Include Diary in agenda
(add-to-list 'load-path "~/PhD/PROJECTS/")
(add-to-list 'load-path "~/WORK/DIARY/")
(add-to-list 'load-path "~/PhD/PROJECTS/1.CONFLEARN/3.doc/")
(add-to-list 'load-path "~/PhD/PROJECTS/1.CONFLEARN/1.R/")
(add-to-list 'load-path "~/PhD/BIBTEX/1.CONFLEARN_BIBTEX/master.bib")
(add-to-list 'load-path "~/PhD/PROJECTS/3.BUCKET_AR2/")
(add-to-list 'load-path "~/PhD/PROJECTS/5.CIRCULAR_BUCKET/")
(add-to-list 'load-path "~/PhD/PROJECTS/DIARY/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Here are some additional functions/macros that could help you configure Doom:
 ;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.
;;
;; ====== HL-TODO ==========
;; https://github.com/tarsius/hl-todo
(global-hl-todo-mode)
(setq hl-todo-keyword-faces
      '(;("TODO"   . "#FF0000")
        ("FIXME"  . "#FF0000")
        ("DEBUG"  . "#A020F0")
        ("GOTCHA" . "#FF4500")
        ("STUB"   . "#1E90FF")))

;; Load org-mode agenda 

(load "~/.doom.d/org_agenda_settings.el")
(load "~/.doom.d/org_capture.el")
;(load "~/.doom.d/org_gcal_settings.el")

(require 'magit)

;;; browser settings
;`'(setq browse-url-browser-function 'eww-browse-url)
(setq browse-url-browser-function 'browse-url-default-macosx-browser)
(load! "bindings")

;; DIRECTORIES FOR NOTE TAKING AND BIBTEX / HELM WITH ORG ROAM
;; https://rgoswami.me/posts/org-note-workflow/
;; Use this link if you need advice on how to do this
;;
;; Helm bibtex = allows you to search .bib files easily
;; org-ref = allows you to use the


(pdf-loader-install)

; Centaur tabs creates those nice tabs 
(load "~/.doom.d/centaur_tabs.el")

(require 'projectile)
(projectile-mode +1)
;(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
;(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;; Python interpreter
(setq python-shell-interpreter "python3"
      flycheck-python-pycompile-executable "python3")
(require 'ein)

;(add-hook 'emacs-startup-hook 'treemacs)



;; Attempt to remove lag
(setq key-chord-two-keys-delay 0.7)

;; Transparent screen
;(set-frame-parameter (selected-frame)'alpha '(95 . 90))
;(add-to-list 'default-frame-alist'(alpha . (95 . 90)))

; Org super agenda for workflow
(load "~/.doom.d/org_super_agenda.el")

; Workflow for writing papers 
(load "~/.doom.d/academic_workflow.el")
(load "~/.doom.d/org_noter_setup.el")
(load "~/.doom.d/org_roam_setup.el")
