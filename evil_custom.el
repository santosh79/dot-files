(defun my-k ()
  "Read a char.  If `j' then invoke `evil-normal-state'.  Else insert it."
  (interactive)
  (let ((ch  (read-char-exclusive)))
    (if (eq ?j ch)
      (evil-normal-state)
      (insert "k" (string ch)))))

(global-set-key "k" 'my-k)

(evil-define-key 'insert 'global (kbd "C-SPC") 'evil-normal-state)

(evil-define-key 'normal 'global (kbd "1") 'evil-end-of-line)
(evil-define-key 'normal 'global (kbd "SPC b") 'switch-to-buffer)

(evil-define-key 'normal 'global (kbd "SPC q") 'evil-quit)
(evil-define-key 'normal 'global (kbd "SPC v n") 'evil-window-vsplit)
(evil-define-key 'normal 'global (kbd "SPC w w") 'save-buffer)
(evil-define-key 'normal 'global (kbd "SPC i b") 'ibuffer)
(evil-define-key 'normal 'global (kbd "SPC l") 'evil-window-next)
(evil-define-key 'normal 'global (kbd "SPC s") 'evil-window-split)
(evil-define-key 'normal 'global (kbd "C-p") 'ido-find-file)
(evil-define-key 'normal 'global (kbd "C-o") 'prevoius-buffer)
(evil-define-key 'normal 'global (kbd "SPC SPC x") 'execute-extended-command)
(evil-define-key 'normal 'global (kbd "C-k") 'kill-buffer)
(evil-define-key 'normal 'global (kbd "SPC o n") (lambda () (evil-shell-command ":on")))

(add-hook 'clojure-mode-hook
          (lambda ()
            (progn
              (require 'evil)
              (require 'cider)
              (evil-define-key 'normal 'clojure-mode-map (kbd "SPC x") 'cider-connect)
              (evil-define-key 'normal 'clojure-mode-map (kbd "SPC p") 'cider-eval-defun-at-point)
              (evil-define-key 'normal 'clojure-mode-map (kbd "SPC d") 'cider-doc)
              )))

(add-hook 'rust-mode-hook
          (lambda ()
            (progn
              (require 'evil)
              (evil-define-key 'normal 'rust-mode-map (kbd "SPC r u") 'rust-run)
              (evil-define-key 'normal 'rust-mode-map (kbd "SPC r t") 'rust-test)
              (evil-define-key 'normal 'rust-mode-map (kbd "SPC r c") 'rust-compile)
              (setq indent-tabs-mode nil)
              )))

(evil-define-key 'normal 'global (kbd "C-o") 
                 (lambda ()
                   (interactive)
                   (other-window -1)))

(evil-define-key 'normal 'global (kbd "SPC e") 
                 (lambda ()
                   (interactive)
                   (dired (message (file-name-directory buffer-file-name)))))

(evil-define-key 'normal 'global (kbd "SPC t") 
                 (lambda ()
                   (interactive)
                   (dired-other-window (message (file-name-directory buffer-file-name)))))

(add-hook 'ruby-mode-hook 'rufo-minor-mode)

(add-hook 'org-mode-hook
          (lambda ()
            (progn
              (require 'evil)
              (evil-define-key 'normal 'org-mode-map  (kbd "SPC RET") 'org-toggle-checkbox)
)))


(add-hook 'elixir-mode-hook
          (lambda ()
            (progn
              (require 'evil)
              (evil-define-key 'normal 'elixir-mode-map  (kbd "SPC c o") 'comment-line)
              (evil-define-key 'visual 'elixir-mode-map  (kbd "SPC c o") 'comment-or-uncomment-region)

              (evil-define-key 'normal 'elixir-mode-map  (kbd "SPC r u") '(lambda ()
                                                                          (interactive)
                                                                          (shell-command (concat "elixir " (message (buffer-file-name)))))))))

(add-hook 'ruby-mode-hook
          (lambda ()
            (progn
              (require 'evil)

              (evil-define-key 'normal 'ruby-mode-map  (kbd "SPC r u") '(lambda ()
                                                                          (interactive)
                                                                          (shell-command (concat "ruby " (message (buffer-file-name)))))))))



(evil-define-key 'visual 'global (kbd "C-c") 'evil-normal-state)
(evil-define-key 'visual 'global (kbd "1") 'evil-end-of-line)
(evil-define-key 'normal 'global (kbd "SPC SPC v") 'evil-visual-line)
(evil-define-key 'normal 'global (kbd "SPC ;") 'shell)
