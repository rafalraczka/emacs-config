;;; my-init.el --- Utilities for Emacs initialization -*- lexical-binding: t -*-

;; Copyright (C) 2022 Rafał Rączka <info@rafalraczka.com>

;; Author: Rafał Rączka <info@rafalraczka.com>
;; URL: https://github.com/rafalraczka/config-emacs

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

(defun my-init-check-emacs-version (ver)
  "Give warning about old Emacs if `emacs-version' is lower than VER."
  (when (version< emacs-version ver)
    (warn "%s %s\n  %s %s %s"
          "Your Emacs version is" emacs-version
	  "this configuration was only tested with version" ver "or higher")))

(my-init-check-emacs-version "27.2")

(provide 'my-init)

;;; my-init.el ends here