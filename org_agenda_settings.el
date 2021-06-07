;;   ORG AGENDA SETTINGS
(after! org (setq org-agenda-files (list "~/PhD/PROJECTS/DIARY/PhD_diary.org" ; phd diary / meetings
                                         "~/PhD/PROJECTS/DIARY/PhD_work.org" ; phd todos
                                         "~/WORK/DIARY/WORK.org" ; work project notes
                                         "~/WORK/1.PROJECTS/3.Azure_Deops/COVID19%20-%20Modeling%20and%20Analytics/screening_protocol_gp/1.Project_Management/DIARY.org"))) ; nfi what this is



(after! org
(setq org-agenda-skip-scheduled-if-done t
      org-agenda-text-search-extra-files '(agenda-archives) ; archive search (s)
      org-agenda-skip-deadline-if-done t
      org-agenda-include-deadlines t
      org-agenda-block-separator t
      org-agenda-compact-blocks t
      ;org-agenda-start-day nil ;; i.e. today
      org-agenda-start-on-weekday nil
      org-support-shift-select t
      org-agenda-start-day nil
      org-agenda-span 7
      org-agenda-start-with-log-mode t
      org-agenda-dim-blocked-tasks nil
      org-agenda-compact-blocks t
      org-agenda-tags-column -100 ; take advantage of the screen width
      org-agenda-show-log t
      org-agenda-sticky t
      ;org-agenda-use-tag-inheritance t
      org-agenda-skip-scheduled-if-done t
      org-agenda-skip-deadline-if-done t
      org-deadline-warning-days 60
      org-enforce-todo-dependencies t ; you have to mark children as done before parent item
      org-log-done (quote time) ; mark when things got done
      org-log-redeadline (quote time) ; mark when you rescheduled deadline for something
      org-log-reschedule (quote time) ; mark when you changed scheduled date for something
      org-clock-history-length 23
      org-clock-in-resume t
      org-clock-into-drawer t
      org-clock-out-remove-zero-time-clocks t
      org-clock-out-when-done t
      ;org-clock-persist t
      ;org-clock-persist-query-resume nil
      org-clock-auto-clock-resolution (quote when-no-clock-is-running)
      org-clock-report-include-clocking-task t
      org-clock-idle-time 15
      org-time-stamp-rounding-minutes (quote (0 5))
      org-agenda-time-grid (quote
       ((daily today remove-match)
        (900 1000 1100 1200 1300 1400 1500 1600 1700 1800)
        "......" "----------------"))
      ;org-blank-before-new-entry (quote ((heading) (plain-list-item)))
      ))


;; ==========================================================================

;(org-agenda nil "a") ;; automatically open atis startup

;; ========== Orgmode keywords for TODOs ========
(after! org (setq org-todo-keywords
                  (quote ((sequence "PAPER EDITS(e)" "READ(r)" "TODO(t)" "URGENT(u)" "NEXT(n)"
                                    "IN PROGRESS(p)"
                                    "MEETING(me)" "|" "DONE(d)")
              (sequence "WAITING(w)" "|" "PHONE"))))) ; "CANCELLED(c)"

(after! org(setq org-todo-keyword-faces
      (quote (
              ;("PHD DIARY" :foreground "#ad78d7" :weight bold ) ; lilac
              ("PAPER EDITS" :foreground "#5ae5b7" :weight bold)
              ("READ" :foreground "#ffad17" ) ; goldy
              ("TODO" :foreground "#FFFFFF" ) ; white
              ("URGENT" :foreground "#ff536d" :weight bold) ; bright red
              ("NEXT" :foreground "#5ae5b7" ) ; light green
              ("IN PROGRESS" :foreground "#F17EF2" )
              ;("MEETING" :foreground "forest green")
              ("DONE" :foreground "#0ef46f" )
              ("WAITING" :foreground "orange" )
              ;("CANCELLED" :foreground "forest green" ) ;there are
              ("PHONE" :foreground "forest green" )))))

;; This adds a variable so you can have global tags in org-mode for GTD
(after! org (setq org-tag-list '(("@work" . ?w) ("@home" . ?h) ("@PhD" . ?l)  ("@computer" . ?l))))


;;(after! org (setq org-agenda-files (append (file-expand-wildcards "~/.org/gtd/*.org"))))

(after! org (setq org-columns-default-format
      "%TODO %30ITEM %6CLOCKSUM %20DEADLINE %20SCHEDULED %PRIORITY %TAGS %8Effort(Effort){:} "))
                                        ; Define Effort estimates for your work
(after! org (setq org-global-properties (quote (("EFFORT_ALL" . "0:15 0:30 0:45 1:00 2:00 3:00 4:00 5:00 6:00 8:00")))))


;; Define a function that switches project to done when subtasks are done
(after! org (defun org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)   ; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO")))))

(after! org (add-hook 'org-after-todo-statistics-hook 'org-summary-todo))
(after! org (setq org-enforce-todo-dependencies t)) ;; requires subtask to be done before parent is done


;;===========  CLOCKING IN AND OUT OF TASKS ===============
;; clocking in: C-c C-x C-i = clocking in
;; clocking out: C-c C-x C-i = clocking out

;(after! org (setq org-agenda-time-grid
      ;(quote
       ;((daily today remove-match)
       ; (900 1000 1100 1200 1300 1400 1500 1600 1700 1800)
       ; "......" "----------------"))))

;; Transparent screen
;(set-frame-parameter (selected-frame)'alpha '(95 . 90))
;(add-to-list 'default-frame-alist'(alpha . (95 . 90)))

;;====================== OTHER SETTINGS ================================
;; Custom agenda command definitions
;;

;; ===============================================================
; ======= ORG AGENDA SUPER GROUP ======
; https://github.com/alphapapa/org-super-agenda/blob/master/examples.org#automatically-by-group

(after! org(setq org-columns-default-format
      "%TODO %30ITEM %6CLOCKSUM %20DEADLINE %20SCHEDULED %PRIORITY %TAGS %8Effort(Effort){:} "))
                                        ; Define Effort estimates for your work
(after! org (setq org-global-properties (quote (("EFFORT_ALL" . "0:15 0:30 0:45 1:00 2:00 3:00 4:00 5:00 6:00 8:00")))))


;; Define a function that switches project to done when subtasks are done
(after! org (defun org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)   ; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO")))))

(after! org (add-hook 'org-after-todo-statistics-hook 'org-summary-todo))
(after! org (setq org-enforce-todo-dependencies t)) ;; requires subtask to be done before parent is done

;;===========  CLOCKING IN AND OUT OF TASKS ===============
;; clocking in: C-c C-x C-i = clocking in
;; clocking out: C-c C-x C-i = clocking out
(after! org (setq org-agenda-time-grid
      (quote
       ((daily today remove-match)
        (900 1000 1100 1200 1300 1400 1500 1600 1700 1800)
        "......" "----------------"))))
