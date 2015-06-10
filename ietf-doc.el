;;
;; March 21 2015, Christian Hopps <chopps@gmail.com>
;;
;; Copyright (c) 2015 by Christian E. Hopps
;; All rights reserved.
;;
;;; Commentary:
;;
;; These are function useful for interacting with the IETF docs.
;;
;;; Code:

;; (defgroup  'ietf-doc (())
;;   "Customizable variables for ietf-doc functions")

;; (defcustom ietf-doc-directory "~/Dropbox/IETF/doc-cache/"
;;   "Local directory to store downloaded IETF documents created if necessary"
;;   :type filename
;;   :group ietf-doc)

;; Suggested binding: C-c i o
;; (global-set-key (kbd "C-c i o") 'ietf-doc-open-at-point)

(defvar ietf-doc-cache-directory "~/Dropbox/IETF/doc-cache/")

(defvar ietf-doc-draft-url-directory "http://tools.ietf.org/id/")

(defvar ietf-doc-rfc-url-directory "http://tools.ietf.org/rfc/")

(defun ietf-doc-starts-with (string prefix)
  "Return t if STRING starts with prefix."
  (let* ((l (length prefix)))
    (string= (substring string 0 l) prefix)))

(defun ietf-doc-at-point ()
  (interactive)
  (concat (file-name-sans-extension (file-name-base (thing-at-point 'filename))) ".txt"))

(defun ietf-doc-normalize-filename (filename)
  (concat (file-name-sans-extension (downcase filename)) ".txt"))

(defun ietf-doc-fetch-to-cache (filename &optional reload)
  (let* ((pathname (concat ietf-doc-cache-directory (downcase filename)))
         url)
    (if (and (file-exists-p pathname) (not reload))
        (message "Cached path %s" pathname)
      (setq filename (downcase filename))
      (make-directory ietf-doc-cache-directory t)
      (if (ietf-doc-starts-with filename "rfc")
          (setq url (concat ietf-doc-rfc-url-directory filename))
        (setq url (concat ietf-doc-draft-url-directory filename)))
      (message url)
      (url-copy-file url pathname t)
      (message "Downloading %s to %s" url pathname)
      pathname)
    pathname))

(defun ietf-doc-at-point-fetch-to-cache (&optional reload)
  (interactive "p")
  (ietf-doc-fetch-to-cache (ietf-doc-at-point) reload))

(defun ietf-doc-open-at-point (&optional reload)
  "Open the IETF internet-draft or RFC indicated by the point. Reload
  the cache if C-u prefix is specified"
  (interactive "p")
  (let ((pathname (ietf-doc-at-point-fetch-to-cache reload)))
    (find-file pathname)))

(provide 'ietf-doc)
;;; ietf-doc.el ends here
