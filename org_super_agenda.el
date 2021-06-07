 (use-package! org-super-agenda
  :after org-agenda
  :init
  (setq org-agenda-skip-scheduled-if-done t
      org-agenda-skip-deadline-if-done t
      org-agenda-include-deadlines t
      org-agenda-block-separator nil
      org-agenda-compact-blocks t
      org-agenda-start-day nil ;; i.e. today
      org-agenda-span 1
      org-agenda-start-on-weekday nil)
  (setq org-agenda-custom-commands
        '(("s" "Super view"
           ((agenda "" ((org-agenda-overriding-header "")
                         (org-super-agenda-groups
                          '((:log t)
                            (:name "TAKES LESS THAN 30 MINS"
                             :effort< "0:30")
                            (:name "TODAY"
                             :date today
                             :order 1)
                            (:name "WORK GENERAL TASKS"                                                              
                             :file-path "~/WORK/DIARY/WORK.org"
                             :order 2)
                            (:name "TESTING MODEL"                                                              
                             :file-path "~/WORK/1.PROJECTS/3.Azure_Deops/COVID19%20-%20Modeling%20and%20Analytics/screening_protocol_gp/1.Project_Management/DIARY.org"
                             :order 3)
                            (:name "PRIORITY INBOX"
                             :todo "A"
                             :order 4)
                            (:name "NEXT"
                             :priority "NEXT"
                             :order 5)
                            (:name "PHD TASKS"
                             :file-path "~/pCloud Drive/ORGMODE_GTD/PhD_work.org"
                             :order 6)
                            (:name "PHD DIARY"
                             :file-path "~/PhD/PROJECTS/DIARY/PhD_diary.org"                                  
                             :order 7)
                            (:name "DEADLINES COMING UP"
                             :deadline future                            
                             :order 8)
                            (:name "OVERDUE DEADLINE TASKS" ; items that have been scheduled or due in the past
                             :deadline past
                             :order 9)
                            (:name "OVERDUE SCHEDULED TASKS" ; items that have been scheduled or due in the past
                             :scheduled past                             
                             :order 10)
                            (:name "SCHEDULED SOON"
                             :scheduled future           
                             :order 11)
                            (:name "MEETING"
                             :and (:todo "MEETING" :scheduled future)
                             :order 12)
                                                        ;(:discard (:not (:todo "TODO")))
                            ))))))))
  :config
  (org-super-agenda-mode))
