;; KID自己的配置文件
;;
;;
;;
;; 开始

;; 全局
;;; Setting English Font
(set-face-attribute
  'default nil :font "Monaco 14") 
;;; Chinese Font(useless)
(dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font)
                      charset
                      (font-spec :family "Helvetica" :size 14)))
;;; 滚动行数(适用于有touchpad的mac)
(defun up-slightly () (interactive) (scroll-up 1))
(defun down-slightly () (interactive) (scroll-down 1))
                                        ;;(global-set-key [mouse-4] 'down-slightly)
                                        ;;(global-set-key [mouse-5] 'up-slightly)
(global-set-key (kbd "<wheel-down>") 'up-slightly)
(global-set-key (kbd "<wheel-up>") 'down-slightly)
;;; 试着修正全角半角输入的问题
;;;; 需要解决的字符： +-*/[]()
(defun insert-char-a () (interactive) (insert-char 43))
(defun insert-char-b () (interactive) (insert-char 45))
(defun insert-char-c () (interactive) (insert-char 42))
(defun insert-char-d () (interactive) (insert-char 47))
(defun insert-char-e () (interactive) (insert-char 91))
(defun insert-char-f () (interactive) (insert-char 93))
(defun insert-char-g () (interactive) (insert-char 40))
(defun insert-char-h () (interactive) (insert-char 41))
(global-set-key (kbd "＋") 'insert-char-a)
(global-set-key (kbd "－") 'insert-char-b)
(global-set-key (kbd "＊") 'insert-char-c)
(global-set-key (kbd "／") 'insert-char-d)
(global-set-key (kbd "［") 'insert-char-e)
(global-set-key (kbd "］") 'insert-char-f)
(global-set-key (kbd "（") 'insert-char-g)
(global-set-key (kbd "）") 'insert-char-h)
;;
;; org-mode 配置
;;; todo-keywords
(setq org-startup-indented t) ;; 以更明了的形式显示标题，可以用M-x org-indent-mode切换，也可以在文件头部增加#+STARTUP:indent
(setq org-todo-keywords ;;设置TODO的任务状态列表
      '((sequence "TODO(t!)" "PERIODIC(p)" "STARTED(s)" "WAITTING(w)" "|" "DONE(d !)" "CANCELLED(c @/!)" "DEFERRED(f @/!)" "IN(i @/!)" "OUT(o @/!)")
        )
      )
(setq org-todo-keyword-faces ;; 设置状态的字体颜色
      '(("TODO" . (:foreground "red" :weight bold))
        ("PERIODIC" . (:foreground "Violet" :weight bold))
        ("STARTED" . (:foreground "DarkOrange" :weight bold))
        ("WAITTING" . (:foreground "white" :weight bold))
        ("DONE" . (:foreground "LightGreen" :weight bold))
        ("CANCELLED" . (:foreground "gray" :weight bold))
        ("DEFERRED" . (:foreground "DarkGreen" :weight bold))
        )
      )

(setq org-agenda-files ;; 设置org-mode的agenda view数据来源
      (list "~/workspace/orgs/gtd.org"
            ))

(define-key global-map "\C-ca" 'org-agenda);; 设置日程表快捷键

;; emacs命令（用M-x调用）
;;; 打开文件
(defun kid-emacsconfig () ;; 打开kid的emacs配置文件
  (interactive)
  (find-file "~/.emacs.d/lisp/KID.el")
  )
(global-set-key (kbd "C-x C-k c") 'kid-emacsconfig)

(defun kid-gtd () ;;打开gtd文件
  (interactive)
  (find-file "~/workspace/orgs/gtd.org")
  )
(global-set-key (kbd "C-x C-k g") 'kid-gtd)

(defun kid-help-org () ;; 打开org的教程
  (interactive)
  (find-file "~/workspace/orgs/org-mode-tutorial.org")
  )
(global-set-key (kbd "C-x C-k h") 'kid-help-org)

(defun kid-note ()
  (interactive)
  (find-file "~/workspace/note.org")
  )
(global-set-key (kbd "C-x C-k n") 'kid-note)

(defun kid-reload ()
  (interactive)
  (load-file "~/.emacs.d/init.el" )
  )


;; 结束
(org-agenda-list )
(provide 'KID)
