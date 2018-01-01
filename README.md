# lsp-clangd

A configuration for an Emacs LSP client for Clang-based languages
using
[clangd](https://github.com/llvm-mirror/clang-tools-extra/tree/master/clangd)
as the language server.

## Requirements

* `clangd`
* `lsp-mode`

## Installing `clangd`

Since `clangd` is part of `clang-tools-extra` since Clang 5, it can be
installed by all the same methods for installing Clang 5 or later.

With macOs, the easiest way is to install via Homebrew.

``` shell
brew install llvm
```

## Enabling `lsp-clangd`

### Using `use-package`

``` emacs-lisp
(use-package lsp-clangd
  :load-path
  "<path-to-lsp-clangd>"
  :init
  (add-hook 'c-mode--hook #'lsp-clangd-c-enable)
  (add-hook 'c++-mode-hook #'lsp-clangd-c++-enable)
  (add-hook 'objc-mode-hook #'lsp-clangd-objc-enable))
```

### Manually

Install `lsp-mode` via some suitable method and clone this repository
to a suitable path, *e.g.* `<path-to-lsp-clangd>`.

```emacs-lisp
(add-to-list 'load-path "<path-to-lsp-clangd>")

(require 'lsp-clangd)

(add-hook 'c-mode--hook #'lsp-clangd-c-enable)
(add-hook 'c++-mode-hook #'lsp-clangd-c++-enable)
(add-hook 'objc-mode-hook #'lsp-clangd-objc-enable)
```
