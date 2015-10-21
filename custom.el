(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#52676f" "#c60007" "#728a05" "#a57705" "#2075c7" "#c61b6e" "#259185" "#fcf4dc"))
 '(custom-enabled-themes (quote (sanityinc-solarized-dark)))
 '(custom-safe-themes
   (quote
    ("4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" default)))
 '(fci-rule-color "#e9e2cb")
 '(safe-local-variable-values (quote ((no-byte-compile t))))
 '(session-use-package t nil (session))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#c60007")
     (40 . "#bd3612")
     (60 . "#a57705")
     (80 . "#728a05")
     (100 . "#259185")
     (120 . "#2075c7")
     (140 . "#c61b6e")
     (160 . "#5859b7")
     (180 . "#c60007")
     (200 . "#bd3612")
     (220 . "#a57705")
     (240 . "#728a05")
     (260 . "#259185")
     (280 . "#2075c7")
     (300 . "#c61b6e")
     (320 . "#5859b7")
     (340 . "#c60007")
     (360 . "#bd3612"))))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; -----------------------------------------------------------------------------
;; Hawstein's custom settings
;; -----------------------------------------------------------------------------

;; for ghc mode

(let ((my-cabal-path (expand-file-name "~/Library/Haskell/bin")))
  (setenv "PATH" (concat my-cabal-path ":" (getenv "PATH")))
  (add-to-list 'exec-path my-cabal-path))

(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init)))

;; scala mode 2 by Hawstein
(add-to-list 'load-path "/Users/hawstein/scala-mode2/")
(require 'scala-mode2)

;; show line num
(global-linum-mode t)

;; set mark
(global-set-key (kbd "C-,") 'set-mark-command)

;; go to line
(global-set-key (kbd "M-g") 'goto-line)

;; -----------------------------------------------------------------------------
;; setting font for mac system
;; -----------------------------------------------------------------------------
;; Setting English Font
(set-face-attribute
 'default nil :font "Monaco 12")
;; Chinese Font 配制中文字体
(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font)
                    charset
                    (font-spec :family "Kaiti SC" :size 13)))
;; Note: you can chang "Kaiti SC" to other fonts

;; delete current line
(global-set-key (kbd "M-l") 'kill-whole-line)

;; windows operation
(global-set-key (kbd "M-1") 'delete-other-windows)
(global-set-key (kbd "M-2") 'split-window-vertically)
(global-set-key (kbd "M-3") 'split-window-horizontally)
(global-set-key (kbd "M-4") 'kill-this-buffer)
(global-set-key (kbd "M-0") 'other-window)

;; newline when in the middle of line
(global-set-key [S-return] '(lambda ()
(interactive)
(move-end-of-line 1)
(newline-and-indent)))

;; buffer operation
(global-set-key [C-left] 'previous-buffer)
(global-set-key [C-right] 'next-buffer)
(global-set-key [M-left] 'beginning-of-buffer)
(global-set-key [M-right] 'end-of-buffer)

(defun comment-or-uncomment-region-or-line ()
    "Comments or uncomments the region or the current line if there's no active region."
    (interactive)
    (let (beg end)
        (if (region-active-p)
            (setq beg (region-beginning) end (region-end))
            (setq beg (line-beginning-position) end (line-end-position)))
        (comment-or-uncomment-region beg end)))

(global-set-key (kbd "M-/") 'comment-or-uncomment-region-or-line)

;; this function is in init-utils.el
(global-set-key (kbd "C-c r") 'rename-this-file-and-buffer)

(provide 'custom)
;;; custom.el ends here
