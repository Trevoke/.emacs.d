(setq diary-file "~/Google Drive/diary")

(setq view-diary-entries-initially t
      mark-diary-entries-in-calendar t
      number-of-diary-entries 7)
(add-hook 'diary-display-hook 'diary-fancy-display)
(add-hook 'today-visible-calendar-hook 'calendar-mark-today)
