;; -*- emacs-lisp -*-
(defun tkj-insert-serial-version-uuid()
  (interactive)
  (insert "private static final long serialVersionUID = 1L;")
)

(defun my-c-mode-hook ()
  (setq c-basic-offset 4
        c-label-offset 0
        indent-tabs-mode nil
        compile-command "cd ~/src/DocEngine; mvn -o -DskipTests package"
        require-final-newline nil)
  (auto-fill-mode)
  (c-set-offset 'substatement-open 0)
  (define-key c-mode-base-map "\C-m" 'c-context-line-break)
  (define-key c-mode-base-map "\C-c\C-i" 'yas/expand)
  ;; Setting up a number of Java related shortcuts to mimic IDEA.
  (define-key c-mode-base-map "\C-\M-g" 'eclim-java-find-declaration)
  (define-key c-mode-base-map "\C-\M-o" 'eclim-java-import-organize)
  (define-key c-mode-base-map "\C-q" 'eclim-java-show-documentation-for-current-element)
  (define-key c-mode-base-map (kbd "<M-f7>") 'eclim-java-find-references)
  (define-key c-mode-base-map (kbd "<S-f6>") 'eclim-java-refactor-rename-symbol-at-point)
  (define-key c-mode-base-map "\C-\M-j" 'tkj-insert-serial-version-uuid)
  
  (subword-mode)
  (gtags-mode)
  )
(add-hook 'c-mode-common-hook 'my-c-mode-hook)


