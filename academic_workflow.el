; EMACS ACADEMIC PAPER WRITING WORKFLOW;
(require 'org-ref)
(require 'helm-bibtex)
(require 'deft)

;; Set up org-mode export stuff
;; This maps on your headings in org-mode to latex headings
;; http://www.wouterspekkink.org/academia/writing/tool/doom-emacs/2021/02/27/writing-academic-papers-with-org-mode.html
  (add-to-list 'org-latex-classes
               '("apa6"
                 "\\documentclass{apa6}"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

(setq reftex-default-bibliography '("~/PhD/PROJECTS/DIARY/master.bib"))

(after! deft
  (setq
   deft-extensions '("txt" "tex" "org")
   ; the file field is specified to work with the .bib file generated by Zotero
   deft-directory "~/PhD/PROJECTS/DIARY/Notes/"
   deft-text-mode 'deft-org-mode-title-prefixdeft-use-filename-as-title
   deft-recursive t
   deft-use-filter-string-for-filename t ; use string to generate filename
   deft-savehist-autosave-interval 0))

(after! helm
  (setq
        bibtex-completion-pdf-field "File"
        bibtex-completion-notes-path "~/PhD/PROJECTS/DIARY/Notes/papers/"
        bibtex-completion-library-path "~/PhD/PAPERS/PhD/"
        bibtex-completion-pdf-field "File"
        ;bibtex-completion-find-additional-pdfs t
        bibtex-completion-pdf-symbol "⌘"
        bibtex-completion-notes-symbol "✎"
        bibtex-completion-bibliography "~/PhD/PROJECTS/DIARY/master.bib"
        bibtex-completion-notes-template-multiple-files
        ;; multiple files
        (concat
  "#+TITLE: ${title}\n"
  "#+ROAM_KEY: cite:${=key=}\n"
  "* TODO Notes\n"
  ":PROPERTIES:\n"
  ":Custom_ID: ${=key=}\n"
  ":NOTER_DOCUMENT: %(orb-process-file-field \"${=key=}\")\n"
  ":AUTHOR: ${author-abbrev}\n"
  ":JOURNAL: ${journaltitle}\n"
  ":DATE: ${date}\n"
  ":YEAR: ${year}\n"
  ":DOI: ${doi}\n"
  ":URL: ${url}\n"
  ":END:\n\n"
  ) ;; end concat
  )
)




 ;; The function below allows me to consult the pdf of the citation I currently have my cursor on.
 (defun my/org-ref-open-pdf-at-point ()
  "Open the pdf for bibtex key under point if it exists."
  (interactive)
  (let* ((results (org-ref-get-bibtex-key-and-file))
         (key (car results))
         (pdf-file (funcall org-ref-get-pdf-filename-function key)))
    (if (file-exists-p pdf-file)
        (find-file pdf-file)
      (message "No PDF found for %s" key))))


(after! org-ref ;; org-ref setup)
(setq
         ;org-ref-completion-library 'org-ref-ivy-cite
         org-ref-get-pdf-filename-function 'org-ref-get-pdf-filename-helm-bibtex
         org-ref-default-bibliography '("~/PhD/PROJECTS/DIARY/master.bib") ; must be a list
         org-ref-bibliography-notes "~/PhD/PROJECTS/DIARY/Notes/papers/PhD_reading.org"
         ;org-ref-note-title-format "* TODO %y - %t\n :PROPERTIES:\n  :Custom_ID: %k\n  :NOTER_DOCUMENT: %F\n :ROAM_KEY: cite:%k\n  :AUTHOR: %9a\n  :JOURNAL: %j\n  :YEAR: %y\n  :VOLUME: %v\n  :PAGES: %p\n  :DOI: %D\n  :URL: %U\n :END:\n\n"
         org-ref-notes-path "~/PhD/PROJECTS/DIARY/Notes/papers"
         org-ref-open-pdf-function 'my/org-ref-open-pdf-at-point
         org-latex-pdf-process (list "latexmk -pdflatex='%latex -shell-escape -interaction nonstopmode' -pdf -bibtex -f -output-directory=%o %f")
         org-ref-notes-function 'orb-edit-notes
         org-ref-pdf-directory '("~/PhD/PAPERS/PhD/")
         ))


; Building pdf files via latex
(setq org-latex-pdf-process (list "latexmk -shell-escape -bibtex -f -pdf %f"))

;; This is to use pdf-tools instead of doc-viewer
(use-package! pdf-tools
  :config
  (pdf-tools-install)
  ;; This means that pdfs are fitted to width by default when you open them
  (setq-default pdf-view-display-size 'fit-width)
  :custom
  (pdf-annot-activate-created-annotations t "automatically annotate highlights"))

