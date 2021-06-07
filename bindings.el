;;; ~/.doom.d/bindings.el -*- lexical-binding: t; -*-
;;; Bindings for JsPsych
(map! "C-c o" #'eww-open-file)
(map! "C-c b" #'eww-browse-with-external-browser)
;; latex bindings for viewing pdf
(map! "C-c C-v" #'TeX-pdf-tools-sync-view)

; Keywords
(map! :map org-agenda-keymap "j" #'org-agenda-next-line)
(map! :map org-agenda-mode-map "j" #'org-agenda-next-line)
(map! :map org-super-agenda-header-map "j" #'org-agenda-next-line)
(map! :map org-agenda-keymap "k" #'org-agenda-previous-line)
(map! :map org-agenda-mode-map "k" #'org-agenda-previous-line)
(map! :map org-super-agenda-header-map "k" #'org-agenda-previous-line)
(map! :map org-super-agenda-header-map "k" #'org-agenda-previous-line)
(map! :map org-super-agenda-header-map "k" #'org-agenda-previous-line)

;(define-key hl-todo-mode-map (kbd "C-c p") 'hl-todo-previous)
;(define-key hl-todo-mode-map (kbd "C-c n") 'hl-todo-next)
;define-key hl-todo-mode-map (kbd "C-c o") 'hl-todo-occur)
;(define-key hl-todo-mode-map (kbd "C-c i") 'hl-todo-insert)

;(global-set-key [f8] 'deft)

(map! "C-c d" #'deft)
; ;;key to launch deft
;(global-set-key (kbd "C-c d") 'deft)
