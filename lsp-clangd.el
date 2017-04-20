;;; lsp-clangd.el --- clangd support for lsp-mode -*- lexical-binding: t; -*-

;; Copyright (C) 2017 Thomas Brown <tabsoftwareconsulting@gmail.com>

;; Author: Thomas Brown <tabsoftwareconsulting@gmail.com>
;; Version: 1.0
;; Package-Requires: ((lsp-mode "2.0") (emacs "24.3"))
;; Keywords: clang, clangd, c, c++
;; URL: https://github.com/tee3/lsp-clangd

;;; Commentary:

;;; Code:

(require 'cc-mode)
(require 'lsp-mode)

(defcustom lsp-clangd-executable
  "clangd"
  "The clangd executable."
  :type '(string)
  :group 'lsp-mode)

(defun lsp-clangd--get-root ()
  "Return the root directory of a clangd project."
  (or (locate-dominating-file default-directory "compile_commands.json")
      (user-error "Could not find clangd project root")))

(lsp-define-stdio-client 'c++-mode "c++" 'stdio
                         #'lsp-clangd--get-root
                         "clangd Language Server"
                         (list lsp-clangd-executable)
                         :ignore-regexps '("^Notification ignored.$"))

(lsp-define-stdio-client 'c-mode "c" 'stdio
                         #'lsp-clangd--get-root
                         "clangd Language Server"
                         (list lsp-clangd-executable)
                         :ignore-regexps '("^Notification ignored.$"))

(provide 'lsp-clangd)

;;; lsp-clangd ends here
