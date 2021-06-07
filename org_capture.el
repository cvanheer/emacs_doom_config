; ==========================================================================
;;         ORG MODE NOTE CAPTURE
;;==========================================================================
(setq org-default-notes-file "~/PhD/PROJECTS/DIARY/PhD_diary.org"
      org-capture-templates
                 '("d" "PHD DIARY"  entry
                   (file "~/PhD/PROJECTS/DIARY/PhD_diary.org")
                   "* DIARY ENTRY %?" :empty-lines 1))
