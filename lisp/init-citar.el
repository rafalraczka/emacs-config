;;; init-citar.el --- citar configuration -*- lexical-binding: t -*-

;; Copyright (C) 2022 Rafał Rączka <info@rafalraczka.com>

;; Author: Rafał Rączka <info@rafalraczka.com>
;; URL: https://github.com/rafalraczka/emacs-config

;; This file is NOT part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;;; Code:

(my/package-ensure 'citar)

(defun my/citar-add-watches ()
  (citar-filenotify-setup '(LaTeX-mode-hook org-mode-hook)))

(add-hook 'my-init-first-interaction-hook #'my/citar-add-watches)

(with-eval-after-load 'citar

  (setq citar-bibliography my-envi-bib-files)
  (setq citar-library-paths my-envi-bib-files-directories)
  (setq citar-notes-paths (list my-envi-ref-notes-directory))

  )

(provide 'init-citar)

;;; init-citar.el ends here