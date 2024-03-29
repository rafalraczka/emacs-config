;;; core-use-module.el --- Macro for modular configuration -*- lexical-binding: t; -*-

;; Copyright (C) 2022 Rafał Rączka <info@rafalraczka.com>

;; Author: Rafał Rączka <info@rafalraczka.com>
;; URL: https://codeberg.org/rafalraczka/emacs-config

;; This file is NOT part of GNU Emacs.

;; This program is free software: you can redistribute it and/or modify
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

;;; Code:

(require 'cl-lib)
(require 'core-package)
(require 'core-straight)

(defvar core-use-module-prefix nil)
(defvar core-use-module-package-manager nil)

(defun core-install-local-package (name)
  (let ((dir (expand-file-name (concat "lisp/" (symbol-name name))
                               user-emacs-directory)))
    (straight-use-package
     `(,name :type nil
             :local-repo ,dir))))

(defun core-use-module-install-package (package package-manager)
  (pcase package-manager
    ('straight (straight-use-package package))
    ('package (core-package-ensure package))
    ('local (core-install-local-package package))
    (_ (error "Unknown package manager: %s for package %s"
              package-manager package))))

(cl-defmacro core-use-module (name &key after disable execute install when)
  (declare (indent 1) (debug t))
  `(when (and (null ,disable)
              (or (null (quote ,when)) ,when))
     (let* ((prefix (symbol-name ',core-use-module-prefix))
            (file (format "%s-%s" prefix (symbol-name ,name)))
            (package-manager (when ,install
                               (if (eq ,install t)
                                   core-use-module-package-manager
                                 ,install))))
       (when package-manager
         (core-use-module-install-package ,name package-manager))
       (when ,after
         (eval-after-load ,after (lambda () (require (intern file)))))
       ,@execute)))

;;; Footer:

(provide 'core-use-module)

;;; core-use-module.el ends here
