;;; init-lsp-mode.el --- lsp-mode configuration -*- lexical-binding: t -*-

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

(my/package-ensure 'lsp-mode)

(with-eval-after-load 'lsp-mode

  (setq lsp-headerline-breadcrumb-enable nil)
  (setq lsp-signature-auto-activate nil)

  (with-eval-after-load 'init-company
    (add-hook 'lsp-mode-hook 'company-mode))

  (with-eval-after-load 'init-which-key
    (add-hook 'lsp-mode-hook 'lsp-enable-which-key-integration))

)

(provide 'init-lsp-mode)

;;; init-lsp-mode.el ends here
