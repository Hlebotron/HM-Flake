;; (unless (file-exists-p "~/.emacs")
;;   (create-empty-file "~/.emacs"))
;;(add-to-list 'default-frame-alist
;;    '(font . "dejavu sans mono-15"))
;; (set-frame-font "-ukwn-iosevka-regular-normal-expanded-*-13-*-*-*-d-0-iso10646-11")
(set-face-attribute 'default nil :family "iosevka")
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(ido-mode 1)
(multiple-cursors-mode 1)
(ivy-mode 1)
(auto-revert-mode 1)
(setq display-line-numbers 'relative
      inhibit-startup-message 1)
(require 'nix-mode)
(require 'multiple-cursors)
(require 'key-chord)
(require 'magit)
;; (require 'org-mode)

;; (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; (evil-mode 1)
(defun org-setup () "configure org mode"
       (setq org-hide-emphasis-markers t)
       	     org-ellipsis " ⏷"
	     visual-line-mode 0
	     auto-fill-mode 1)
       (font-lock-mode 1)				
       (org-bullets-mode 1)
       (prettify-symbols-mode 1)
       (font-lock-add-keywords 'org-mode
			       '(("^ *\\([-]\\) "
				  (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))
       (custom-theme-set-faces
	'user
	'(variable-pitch ((t (:family "etbembo" :height 180 :weight thin))))
	'(fixed-pitch ((t ( :family "fira code retina" :height 160)))))
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
				  "beautify org checkbox symbol"
				  (setq prettify-symbols-alist
					(prettify-utils-generate
					 ("[ ]" "☐")
					 ("[x]" "☑")
					 ("[-]" "❍")))
				  (prettify-symbols-mode)))

       


(add-hook 'org-mode-hook 'org-setup)
