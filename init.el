(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(add-to-list 'package-archives  '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'load-path "/usr/share/gtags/")
(add-to-list 'load-path "/home/yuki/.emacs.d/custom/")

(package-initialize)

(load-theme 'solarized t)

(require 'server)
(unless (server-running-p)
  (server-start))

(require 'tramp)
(setq tramp-default-method "ssh")
(setq tramp-shell-prompt-pattern "^.*[#$%>] *")

(require 'elscreen)
(elscreen-start)

(require 'zig-mode)
(add-to-list 'auto-mode-alist '("\\.zig" . zig-mode))
(add-to-list 'auto-mode-alist '("\\.zen" . zig-mode))
						
(defvar my-favorite-package-list
  '(open-junk-file magit nyan-mode neotree yaml-mode company-php ac-php-core ac-php ddskk google-c-style flymake-cursor flymake-google-cpplint iedit auto-complete-c-headers yasnippet-snippets yasnippet w3m php-mode mozc mew company-irony auto-complete-clang-async auto-complete)
  "packages to be installed")

(unless package-archive-contents (package-refresh-contents))
(dolist (pkg my-favorite-package-list)
  (unless (package-installed-p pkg)
    (package-install pkg)))

(setq-default tab-width 4)
(show-paren-mode 1)
(global-hl-line-mode t)
(column-number-mode t)
(global-linum-mode t)
(setq kill-whole-line t)
(setq delete-auto-save-files t)

(require 'powerline)
(powerline-center-theme)

(require 'php-mode)

(add-hook 'php-mode-hook
          '(lambda ()
             ;; Enable auto-complete-mode
             (auto-complete-mode t)

             (require 'ac-php)
             (setq ac-sources '(ac-source-php))

             ;; As an example (optional)
             (yas-global-mode 1)

             ;; Enable ElDoc support (optional)
             (ac-php-core-eldoc-setup)

             ;; Jump to definition (optional)
             (define-key php-mode-map (kbd "M-]")
               'ac-php-find-symbol-at-point)

             ;; Return back (optional)
             (define-key php-mode-map (kbd "M-[")
               'ac-php-location-stack-back)))

(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(setq neo-show-hidden-files t)
(setq neo-create-file-auto-open t)
(setq neo-persist-show t)

(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("/\\urls\\'" . yaml-mode))
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
(require 'yasnippet)
(yas-global-mode 1)
(defun my:ac-c-header-init ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)
  (add-to-list 'achead:include-directories '"/usr/lib/gcc/x86_64-pc-linux-gnu/8.2.0/include/g++-v8")
  )

(require 'cc-mode)

(add-hook 'c++-mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-common-hook
          (lambda ()
            (c-set-style "bsd")
			(setq indent-tabs-mode nil)
            (setq c-basic-offset 4)
            (c-set-offset 'statement-cont 'c-lineup-math)
            (setq show-trailing-whitespace t)))

(add-hook 'c-mode-common-hook 'flycheck-mode)

(defun my-asm-mode-hook ()
  ;; you can use `comment-dwim' (M-;) for this kind of behaviour anyway
  (local-unset-key (vector asm-comment-char))
  ;; (local-unset-key "<return>") ; doesn't work. "RET" in a terminal.  http://emacs.stackexchange.com/questions/13286/how-can-i-stop-the-enter-key-from-triggering-a-completion-in-company-mode
  (electric-indent-local-mode)  ; toggle off
;  (setq tab-width 4)
  (setq indent-tabs-mode nil)
  ;; asm-mode sets it locally to nil, to "stay closer to the old TAB behaviour".
  ;; (setq tab-always-indent (default-value 'tab-always-indent))

  (defun asm-calculate-indentation ()
  (or
   ;; Flush labels to the left margin.
;   (and (looking-at "\\(\\.\\|\\sw\\|\\s_\\)+:") 0)
   (and (looking-at "[.@_[:word:]]+:") 0)
   ;; Same thing for `;;;' comments.
   (and (looking-at "\\s<\\s<\\s<") 0)
   ;; %if nasm macro stuff goes to the left margin
   (and (looking-at "%") 0)
   (and (looking-at "c?global\\|section\\|default\\|align\\|INIT_..X") 0)
   ;; Simple `;' comments go to the comment-column
   ;(and (looking-at "\\s<\\(\\S<\\|\\'\\)") comment-column)
   ;; The rest goes at column 4
   (or 4)))
  )

(add-hook 'asm-mode-hook #'my-asm-mode-hook)

(define-key global-map (kbd "C-c ;") 'iedit-mode)

(global-unset-key (kbd "C-x C-c"))
(defalias 'exit 'save-buffers-kill-emacs)
(global-set-key (kbd "M-n") 'find-file-other-frame)

(require 'gtags)
(global-set-key "\M-t" 'gtags-find-tag)
(global-set-key "\M-r" 'gtags-find-rtag)
(global-set-key "\M-s" 'gtags-find-symbol)
(global-set-key "\C-t" 'gtags-pop-stack)

(setq inferior-lisp-program "clisp")
(require 'slime)
(slime-setup '(slime-repl slime-fancy slime-banner))

(when (require 'skk nil t)
  (global-set-key "\C-\\" 'skk-mode)
  (setq default-input-method "japanese-skk")
  (require 'skk-study))

(set-default-font "Anonymice Powerline-14")

(cond ((display-graphic-p)
       (set-default-font "Anonymice Powerline-14")
       (set-fontset-font (frame-parameter nil 'font)
			 'japanese-jisx0208
			 '("TakaoPGothic" . "unicode-bmp")) )
      (t 0))

(autoload 'mew "mew" nil t)
(autoload 'mew-send "mew" nil t)

(setq read-mail-command 'mew)

;; Optional setup (e.g. C-xm for sending a message):
(autoload 'mew-user-agent-compose "mew" nil t)
(if (boundp 'mail-user-agent)
    (setq mail-user-agent 'mew-user-agent))
(if (fboundp 'define-mail-user-agent)
    (define-mail-user-agent
      'mew-user-agent
      'mew-user-agent-compose
      'mew-draft-send-message
      'mew-draft-kill
      'mew-send-hook))

(setq mew-prog-ssl "/usr/bin/stunnel")
(setq mew-name "Yuki Azuma")
(setq mew-user "yuki")
(setq mew-mail-domain "uefi.jp")
(setq mew-smtp-user "test")
(setq mew-smtp-server "uefi.jp")
(setq mew-smtp-auth t)
(setq mew-smtp-ssl t)
(setq mew-smtp-port 587)
(setq mew-smtp-ssl-port mew-smtp-port)
(setq mew-proto "%")
(setq mew-imap-user "yuki@uefi.jp")
(setq mew-imap-server "uefi.jp")
(setq mew-imap-auth t)
(setq mew-imap-ssl t)
(setq mew-imap-port 143)
(setq mew-imap-ssl-port mew-imap-port)
(setq mew-use-cached-passwd t)
(setq mew-ssl-verify-level 0)

(require 'open-junk-file)
(setq open-junk-file-format "~/org/junk/%Y-%m%d-%H%M%S.")
(global-set-key "\C-xj" 'open-junk-file)

(add-hook 'js-mode-hook
          (lambda ()
            (make-local-variable 'js-indent-level)
            (setq js-indent-level 2)))


(require 'org-agenda)
(global-set-key "\C-ca" 'org-agenda)
(setq org-directory "~/org/junk")
(setq org-agenda-files (list org-directory))
(setq org-default-notes-file "notes.org")
(setq org-src-fontify-natively t)
(define-key global-map "\C-cc" 'org-capture)
(setq org-capture-templates
      '(("n" "Note" entry (file+headline "~/org/notes.org" "Notes")
         "* %?\nEntered on %U\n %i\n %a")
        ))

(require 'review-mode)
(autoload 'review-mode "review-mode" "Re:VIEW Mode" t)

(defun my-find-file-init-el ()
  "open init.el"
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
 '(custom-enabled-themes (quote (solarized)))
 '(custom-safe-themes
   (quote
	("8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" default)))
 '(flymake-google-cpplint-command "/home/yuki/.local/bin/cpplint")
 '(package-selected-packages
   (quote
	(auto-minor-mode dashboard elscreen zig-mode verilog-mode slime elixir-mode powerline flycheck color-theme-solarized mmm-mode vue-mode open-junk-file magit nyan-mode neotree yaml-mode company-php ac-php-core ac-php ddskk google-c-style ## flymake-cursor flymake-google-cpplint iedit auto-complete-c-headers yasnippet-snippets yasnippet w3m php-mode mozc mew company-irony auto-complete-clang-async auto-complete))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(prefer-coding-system 'utf-8)         
(setq coding-system-for-read 'utf-8)  
(setq coding-system-for-write 'utf-8) 
(set-language-environment "Japanese") 
