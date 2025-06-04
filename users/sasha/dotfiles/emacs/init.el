(setq inhibit-startup-message 1)
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(ido-mode 1)
(ivy-mode 1)
(setq display-line-numbers 'relative)
(setq inhibit-startup-message 1)

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(require 'multiple-cursors)
(evil-mode 0)
(defun org-setup () "Configure org mode"
       (setq org-hide-emphasis-markers t)
       (setq org-ellipsis " ⏷")
       (setq visual-line-mode 1)
       (setq auto-fill-mode 1)
       (font-lock-mode 1)
       (org-bullets-mode 1)
       (prettify-symbols-mode 1)
       (custom-theme-set-faces
	'user
	'(variable-pitch ((t (:family "ETBembo" :height 180 :weight thin))))
	'(fixed-pitch ((t ( :family "Fira Code Retina" :height 160)))))
       (dolist (face '(
		       (org-level-1 . 1.2)
		       (org-level-2 . 1.1)
		       (org-level-3 . 1.05)
		       (org-level-4 . 1.0)
		       (org-level-5 . 0.95)
		       (org-level-6 . 0.9)
		       (org-level-7 . 0.85)
		       (org-level-8 . 0.8)))
	 (set-face-attribute (car face) nil :family "iawriter sans duospace" :weight 'bold :height (cdr face)))
       (set-face-attribute 'org-block nil :foreground nil :height 1.0 :inherit 'fixed-pitch)
       (set-face-attribute 'org-code nil :inherit '(shadow fixed-pitch))
       ;; (set-face-attribute 'org-indent nil :inherit '(org-hide fixed-pitch))
       (set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
       (set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
       (set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
       (set-face-attribute 'org-checkbox nil :height 1.0 :inherit 'fixed-pitch)
       (put 'downcase-region 'disabled nil)
       (add-hook 'org-mode-hook (lambda ()
				  "Beautify Org Checkbox Symbol"
				  (setq prettify-symbols-alist
					(prettify-utils-generate
					 ("[ ]" "☐")
					 ("[X]" "☑")
					 ("[-]" "❍")))
				  (prettify-symbols-mode)))
       )

       ;; (setq font-lock-maximum-decoration 1))

(multiple-cursors-mode 1)

(require 'key-chord)
(add-hook 'org-mode-hook 'org-setup)
(key-chord-define-global "fg" "C-s")
;; (use-package 'org-bullets
;;   :config
;;   (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))
(font-lock-add-keywords 'org-mode
                         '(("^ *\\([-]\\) "
                            (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))
