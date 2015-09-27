;;
;; September 27 2015, Christian Hopps <chopps@gmail.com>
;;
;; Copyright (c) 2015 by Christian E. Hopps
;; All rights reserved.
;;

(require 'ietf-docs)

;; interactive

(ert-deftest interactive-test-01 nil
  "This test should not run on Travis"
  :tags '(:interactive)
  (should t))


;; non-interactive

(ert-deftest has-feature-01 nil
  "This test should run on Travis"
  (should (featurep 'ietf-docs)))

;;
;; Emacs
;;
;; Local Variables:
;; indent-tabs-mode: nil
;; coding: utf-8
;; End:
;;

;;; ietf-docs-test.el ends here
