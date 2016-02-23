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

;; org-mode 配置
(setq org-startup-indented t) ;; 以更明了的形式显示标题，可以用M-x org-indent-mode切换，也可以在文件头部增加#+STARTUP:indent
(setq org-todo-keywords ;;设置TODO的任务状态列表
      '((sequence "TODO(t!)" "PERIODIC(p)" "STARTED(s)" "WAITTING(w)" "|" "DONE(d !)" "CANCELLED(c @/!)" "DEFERRED(f @/!)" "IN(i)" "OUT(o)")
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

(defun kid-gtd () ;;打开gtd文件
  (interactive)
  (find-file "~/workspace/orgs/gtd.org")
  )

(defun kid-help-org () ;; 打开org的教程
  (interactive)
  (find-file "~/workspace/orgs/org-mode-tutorial.org")
  )

(defun kid-reload ()
  (interactive)
  (load-file "~/.emacs.d/init.el" )
  )


;; 结束
(provide 'KID)
