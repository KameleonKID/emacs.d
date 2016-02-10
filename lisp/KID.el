;; KID自己的配置文件
;;
;;
;;
;; 开始

;; org-mode 配置
(setq org-startup-indented t) ;; 以更明了的形式显示标题，可以用M-x org-indent-mode切换，也可以在文件头部增加#+STARTUP:indent
(setq org-todo-keywords ;;设置TODO的任务状态列表
      '((sequence "TODO(t!)" "NEXT(n)" "WAITTING(w)" "SOMEDAY(s)" "|" "DONE(d@/!)" "ABORT(a@/!)")
        )
      )

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
