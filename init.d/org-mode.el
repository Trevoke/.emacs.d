(add-to-list 'auto-mode-alist '(".org.txt$" . org-mode))

(setq org-directory "~/Google Drive/notes")
(setq org-default-notes-file (concat org-directory "/notes.org.txt"))
(define-key global-map "\C-cc" 'org-capture)

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(setq org-startup-indented t)
(setq org-log-done 'time)


;;; orgtbl-to-gfm conversion function
;; Usage Example:
;;
;; <!-- BEGIN RECEIVE ORGTBL ${1:YOUR_TABLE_NAME} -->
;; <!-- END RECEIVE ORGTBL $1 -->
;;
;; <!--
;; #+ORGTBL: SEND $1 orgtbl-to-gfm
;; | $0 |
;; -->

(defun orgtbl-to-gfm (table params)
  "Convert the Orgtbl mode TABLE to GitHub Flavored Markdown."
  (let* ((alignment (mapconcat (lambda (x) (if x "|--:" "|---"))
			       org-table-last-alignment ""))
	 (params2
	  (list
	   :splice t
	   :hline (concat alignment "|")
	   :lstart "| " :lend " |" :sep " | ")))
    (orgtbl-to-generic table (org-combine-plists params2 params))))

(defun stag-insert-org-to-md-table (table-name)
  (interactive "*sEnter table name: ")
  (insert "<!---
#+ORGTBL: SEND " table-name " orgtbl-to-gfm

-->
<!--- BEGIN RECEIVE ORGTBL " table-name " -->
<!--- END RECEIVE ORGTBL " table-name " -->")
  (previous-line)
  (previous-line)
  (previous-line))
