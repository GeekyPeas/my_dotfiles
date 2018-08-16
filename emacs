;; evil-mode
;; (add-to-list 'load-path "~/.emacs.d/evil")
;; (require 'evil)
;; (evil-mode 1)

;;dismiss startup screen
(setq inhibit-startup-screen t)

;; load emacs 24's package system. Add MELPA repository.
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   ;; '("melpa" . "http://stable.melpa.org/packages/") ; many packages won't show if using stable
   '("melpa" . "http://melpa.milkbox.net/packages/")
   t))

;; Turn off Auto Backup~ files
(setq make-backup-files nil)

;; Delete-selection-mode
(delete-selection-mode 1)

;; Org-mode settings
(setq org-file-apps
      '((auto-mode . emacs)
        ("\\.x?html?\\'" . "firefox %s")
        ("\\.pdf\\'" . "mupdf \"%s\"")
        ("\\.pdf::\\([0-9]+\\)\\'" . "mupdf \"%s\" -p %1")
        ("\\.pdf.xoj" . "xournal %s")))

(setq org-hierarchical-todo-statistics nil) ;;recursively count TODO 

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-font-lock-mode 1)
(setq org-agenda-files '("~/Records/" "/media/geek/2TB/5 Data/17-18/Journal/" "/media/geek/2TB/5 Data/18-19/Journal/"))

(setq org-todo-keywords
       '((sequence "TODO" "NEXT" "GOAL" "REVW" "WISH" "IDEA" "BOOK" "|" "DONE" "VOID" "LATR")))
(setq org-todo-keyword-faces
      '(("TODO" . (:foreground "#ff3030" :weight bold))("NEXT" . (:foreground "#ff3030" :weight bold))("GOAL" . (:foreground "#ff1493" :weight bold))("REVW" . (:foreground "#ff1493" :weight bold))("WISH" . (:foreground "#daa520" :weight bold))("IDEA" . (:foreground "#daa520" :weight bold))("VOID" . (:foreground "#696969" :weight bold))("DONE" . (:foreground "#32cd32" :weight bold))("BOOK" . (:foreground "#ff3030" :weight bold))("LATR" . (:foreground "#daa520" :weight bold))))

(setq org-tag-persistent-alist
      '(("PROJ" . ?P)("PL" . ?p)("REV" . ?r)("SM" . ?j)("MM" . ?m)("Sself" . ?k)("Hob" . ?h)("Tnk" . ?t)("AD" . ?d)("SBB" . ?b)("Soc" . ?s)("Misc" . ?x)))

(setq org-tag-faces
      '(("PROJ" . (:foreground "#daa520" :weight bold))("PL" . (:foreground "#FFCC99" :weight bold))("REV" . (:foreground "#FFCC00" :weight bold))("SM" . (:foreground "#0066CC" :weight bold))("MM" . (:foreground "#3399FF" :weight bold))("Sself" . (:foreground "#6600FF" :weight bold))("Hob" . (:foreground "#98FFCC" :weight bold))("Tnk" . (:foreground "#98FF33" :weight bold))("AD" . (:foreground "#66CC00" :weight bold))("SBB" . (:foreground "#9933FF" :weight bold))("Soc" . (:foreground "#00CC00" :weight bold))("Misc" . (:foreground "#009900" :weight bold))))

(setq org-enable-priority-commands nil) ;; Disable priorities

;; Disable useless prompts
(fset 'yes-or-no-p 'y-or-n-p)

;; Word wrap
(global-visual-line-mode t)

;; Appearances
(if window-system
    (custom-set-faces
     '(default ((t (:background "#2d2d2d" :foreground "#d3d0c8" :height 128 :width normal :foundry "DAMA" :family "Ubuntu Mono"))))))

;; Transparency
(set-frame-parameter (selected-frame) 'alpha '(85 50))
(add-to-list 'default-frame-alist '(alpha 85 50))

;; Activate python highlighting for PYX and PPL files
(add-to-list 'auto-mode-alist '("\\.pyx\\'" . python-mode))
(add-to-list 'auto-mode-alist '("\\.ppl\\'" . python-mode))

;; Forces the messages to 0, and kills the *Messages* buffer - thus disabling it on startup.
(setq-default message-log-max nil)
(kill-buffer "*Messages*")

;; Disabled *Completions*
(add-hook 'minibuffer-exit-hook 
      '(lambda ()
         (let ((buffer "*Completions*"))
           (and (get-buffer buffer)
            (kill-buffer buffer)))))

;; Disable toolbar
(tool-bar-mode -1)

