(require 'centaur-tabs)
(after! centaur-tabs
  (centaur-tabs-mode 1) ; run at startup
  ;(centaur-tabs-headline-match)
  (setq centaur-tabs-style "slant"
        centaur-tabs-height 32
        centaur-tabs-set-icons t
        centaur-tabs-gray-out-icons 'buffer
        centaur-tabs-set-bar 'below
        centaur-tabs-set-modified-marker t
        centaur-tabs-modified-marker "*"
        ;centaur-tabs-change-fonts "Menlo" 120
        )
  )
