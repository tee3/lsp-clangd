;;; lsp-clangd.el --- clangd support for lsp-mode -*- lexical-binding: t; -*-

;; Copyright (C) 2017 Thomas Brown <tabsoftwareconsulting@gmail.com>

;; Author: Thomas Brown <tabsoftwareconsulting@gmail.com>
;; Version: 3.0
;; Package-Requires: ((lsp-mode "3.0") (emacs "24.3"))
;; Keywords: lsp, clang, clangd, c, c++, objective-c, objective-c++
;; URL: https://github.com/tee3/lsp-clangd

;;; Commentary:

;;; Code:

(require 'lsp-mode)
(require 'lsp-common)

(defcustom lsp-clangd-executable
  "clangd"
  "The clangd executable."
  :type '(string)
  :group 'lsp-mode)

(lsp-define-stdio-client lsp-clangd-c++
                         "cpp"
                         (lsp-make-traverser "compile_commands.json")
                         (list lsp-clangd-executable))

(lsp-define-stdio-client lsp-clangd-c
                         "c"
                         (lsp-make-traverser "compile_commands.json")
                         (list lsp-clangd-executable))

(lsp-define-stdio-client lsp-clangd-objc
                         "objective-c"
                         (lsp-make-traverser "compile_commands.json")
                         (list lsp-clangd-executable))

(lsp-define-stdio-client lsp-clangd-objc++
                         "objective-cpp"
                         (lsp-make-traverser "compile_commands.json")
                         (list lsp-clangd-executable))

(provide 'lsp-clangd)

;;; lsp-clangd.el ends here
