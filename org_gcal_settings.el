;(after! org (setq diary-file "~/PhD/PROJECTS/DIARY/schedule.org"))
;(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
;(require 'org-gcal)
(after! org
(setq org-gcal-client-id "744725710771-mqhb624kj1oodakmhevn4195b9di09pu.apps.googleusercontent.com"
			org-gcal-client-secret "nv15FWFt5UrrTOhFLiKz-psg"
			org-gcal-file-alist '(("https://calendar.google.com/calendar/embed?src=oei4455kd77u3mpg9bf4simtdo%40group.calendar.google.com&ctz=Australia%2FSydney" .  "~/PhD/PROJECTS/DIARY/schedule.org"))))
																	;("another-mail@gmail.com" .  "~/task.org")
