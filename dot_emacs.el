
;; Use MELPA Stable
;;
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))
             
(package-initialize)


;; Theme
;;
(custom-set-variables
 '(custom-enabled-themes (quote (deeper-blue))))
(custom-set-faces
 )


;; Inhibit Startup Screen
;;
(setq inhibit-splash-screen t)


;; Enable Company
;;
(add-hook 'after-init-hook 'global-company-mode)


;; Enable org-mode for R.
;;
(org-babel-do-load-languages
 'org-babel-load-languages
 '((R . t)))


;; Don't ask to run code sections.
;;
(setq org-confirm-babel-evaluate nil)


;; Don't include validation links when exporting to html.
;;
(setq org-html-validation-link nil)


;; Syntax highlighting inside code blocks.
;;
(setq org-src-fontify-natively t)


;; Show inline images in org-mode documents.
;;
(add-hook 'org-babel-after-execute-hook 'org-display-inline-images)
(add-hook 'org-mode-hook 'org-display-inline-images)


;; When starting an R session disable _ for <-
;;
(defun my-config-r-options ()
  "Configure the R process"
  (ess-toggle-underscore nil))

(add-hook 'ess-post-run-hook 'my-config-r-options)


;; Add a hotkey to go to the org-mode R session.
;;
(defun lars-add-org-mode-keys ()
  (local-set-key (kbd "C-c r") 'ess-switch-to-end-of-ESS))

(add-hook 'org-mode-hook 'lars-add-org-mode-keys)


;; Auto refresh DocView.
;;
(add-hook 'doc-view-mode-hook 'auto-revert-mode)

