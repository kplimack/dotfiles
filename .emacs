(setq require-final-newline t)
(setq auto-mode-alist (cons '("\\.tt$" . html-mode) auto-mode-alist))


(defun iwb ()
  "indent whole buffer"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max)))
(global-set-key [f12] 'iwb)
