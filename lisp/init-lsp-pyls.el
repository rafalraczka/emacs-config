;;; init-lsp-pyls.el --- lsp-pyls configuration -*- lexical-binding: t -*-

;; Copyright (C) 2022 Rafał Rączka

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

(require 'init-lsp-mode)

(with-eval-after-load 'python

  (add-hook 'python-mode-hook #'flyspell-mode)
  (add-hook 'python-mode-hook 'lsp-deferred)

  (with-eval-after-load 'init-company
    (add-hook 'python-mode-hook #'company-mode))

  (with-eval-after-load 'init-company-quickhelp

    (defcustom my/lsp-pyls-company-quickhelp-max-lines 5
      "When not nil, limits the number of lines in the popup in Python mode.")

    (defun my/lsp-pyls-set-company-quickhelp-max-lines ()
      (setq-local company-quickhelp-max-lines
                  my/lsp-pyls-company-quickhelp-max-lines))

    (add-hook 'python-mode-hook #'company-quickhelp-local-mode)
    (add-hook 'python-mode-hook #'my/lsp-pyls-set-company-quickhelp-max-lines)

    )

  )

(provide 'init-lsp-pyls)

;;; init-lsp-pyls.el ends here
