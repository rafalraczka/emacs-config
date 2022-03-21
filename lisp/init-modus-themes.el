;;; init-modus-themes.el --- modus-themes configuration -*- lexical-binding: t -*-

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

(straight-use-package
 '(modus-themes :type git
                :flavor melpa
                :branch "main"
                :host gitlab
                :repo "protesilaos/modus-themes"
                :fork (:repo "rafalraczka/modus-themes")))

(if (daemonp)
    (add-hook 'server-after-make-frame-hook 'modus-themes-load-vivendi -50)
  (add-hook 'after-init-hook 'modus-themes-load-vivendi -50))

(with-eval-after-load 'modus-themes
  (setq modus-themes-headings (mapcar (lambda (i)
                                        `(,i . (rainbow)))
                                      (number-sequence 1 9)))
  (setq modus-themes-lang-checkers '(faint))
  (setq modus-themes-links '(no-color))
  (setq modus-themes-mode-line '(borderless))
  (setq modus-themes-org-agenda '((scheduled . rainbow)
                                  (header-date . (bold-today))))
  (setq modus-themes-org-blocks 'gray-background)
  (setq modus-themes-paren-match '(intense))
  (setq modus-themes-syntax '(yellow-comments))
  (setq modus-themes-vivendi-color-overrides '((bg-main . "#191919")
                                               (bg-inactive . "#373737")
                                               (bg-tab-active . "#323232")
                                               (bg-tab-inactive . "#100f10")
                                               (fg-comment-yellow . "#d0ba95")))
  )

(provide 'init-modus-themes)

;;; init-modus-themes.el ends here
