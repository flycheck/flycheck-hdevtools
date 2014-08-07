;;; flycheck-hdevtools.el --- A flycheck checker for Haskell using hdevtools

;; Copyright (C) 2013-2014  Steve Purcell

;; Author: Steve Purcell <steve@sanityinc.com>
;; URL: https://github.com/flycheck/flycheck-hdevtools
;; Keywords: convenience languages tools
;; Package-Requires: ((flycheck "0.19") (dash "2.0"))
;; Version: DEV

;; This file is not part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Adds a Flycheck syntax checker for Haskell based on hdevtools.

;;;; Setup

;; (eval-after-load 'flycheck '(require 'flycheck-hdevtools))

;;; Code:

(require 'dash)
(require 'flycheck)

(defun flycheck-hdevtools-prepend-and-escape (option value)
  "Prepend OPTION to VALUE and escape them."
  (list "-g" option "-g" value))

(flycheck-define-checker haskell-hdevtools
  "A Haskell syntax and type checker using hdevtools.

See URL `https://github.com/bitc/hdevtools'."
  :command
  ("hdevtools" "check" "-g" "-Wall"
   (eval (when flycheck-ghc-no-user-package-database
           (list "-g" "-no-user-package-db")))
   (option-list "-package-db" flycheck-ghc-package-databases
                flycheck-hdevtools-prepend-and-escape)
   (eval (list
          "-g" "-i" "-g"
          (flycheck-module-root-directory
           (flycheck-find-in-buffer flycheck-haskell-module-re))))
   (option-list "-i" flycheck-ghc-search-path
                flycheck-hdevtools-prepend-and-escape)
   source)
  :error-patterns
  ((warning line-start (file-name) ":" line ":" column ":"
            (or " " "\n ") "Warning:" (optional "\n")
            (message
             (one-or-more " ") (one-or-more not-newline)
             (zero-or-more "\n"
                           (one-or-more " ")
                           (one-or-more not-newline)))
            line-end)
   (error line-start (file-name) ":" line ":" column ":"
          (or (message (one-or-more not-newline))
              (and "\n"
                   (message
                    (one-or-more " ") (one-or-more not-newline)
                    (zero-or-more "\n"
                                  (one-or-more " ")
                                  (one-or-more not-newline)))))
          line-end))
  :error-filter
  (lambda (errors)
    (-> errors
      flycheck-dedent-error-messages
      flycheck-sanitize-errors))
  :modes haskell-mode
  :next-checkers ((warnings-only . haskell-hlint)))


(add-to-list 'flycheck-checkers 'haskell-hdevtools)


(provide 'flycheck-hdevtools)
;;; flycheck-hdevtools.el ends here
