;;; init-calendar.el --- calendar configuration -*- lexical-binding: t -*-

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

(with-eval-after-load 'calendar
  (defun my/calendar-mode-config ()
    (setq-local fill-column 71))

  (add-hook 'calendar-mode-hook 'my/calendar-mode-config)

  (setq calendar-left-margin 2)
  (setq calendar-date-style 'iso)

  (setq calendar-minimum-window-height 9)
  (setq calendar-week-start-day 1))

(provide 'init-calendar)

;;; init-calendar.el ends here