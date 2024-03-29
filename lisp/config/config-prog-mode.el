;;; config-prog-mode.el --- prog-mode configuration -*- lexical-binding: t; -*-

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

(defcustom my/prog-mode-fill-column 72
  "Default `fill-column' for programming modes."
  :type 'integer)

(defcustom my/prog-mode-olivetti-body-width 80
  "Default `olivetti-body-width' for programming modes."
  :type 'integer)

(defcustom my/prog-mode-comment-column 40
  "Default `comment-column' for programming modes.")

(defun my/prog-mode-config ()
  (setq-local comment-auto-fill-only-comments t)
  (setq-local comment-column my/prog-mode-comment-column)
  (setq-local fill-column my/prog-mode-fill-column)
  (setq-local olivetti-body-width my/prog-mode-olivetti-body-width))

(add-hook 'prog-mode-hook #'auto-fill-mode)
(add-hook 'prog-mode-hook #'display-line-numbers-mode)
(add-hook 'prog-mode-hook #'hl-todo-mode)
(add-hook 'prog-mode-hook #'my/prog-mode-config)
(add-hook 'prog-mode-hook #'outline-minor-mode)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(add-hook 'prog-mode-hook #'smartparens-mode)

(when (executable-find "aspell")
  (add-hook 'prog-mode-hook #'flyspell-prog-mode))

;;; Footer:

(provide 'config-prog-mode)

;;; config-prog-mode.el ends here
