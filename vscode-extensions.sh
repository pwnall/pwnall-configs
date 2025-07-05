#!/bin/sh

set -e  # Exit on errors.
set -u  # Exit on undefined variables.

# Proven
code --install-extension bazelbuild.vscode-bazel
code --install-extension bierner.markdown-mermaid
code --install-extension fuchsia-authors.language-fidl
code --install-extension fuchsia-authors.vscode-fuchsia
code --install-extension drblury.protobuf-vsc
code --install-extension golang.go
code --install-extension google.geminicodeassist
code --install-extension google.gemini-cli-vscode-ide-companion
code --install-extension google.gn
code --install-extension jnoortheen.nix-ide
code --install-extension leanprover.lean4
code --install-extension llvm-vs-code-extensions.vscode-clangd
code --install-extension mathematic.vscode-pdf
code --install-extension mkhl.direnv
code --install-extension mrmlnc.vscode-json5
code --install-extension ms-azuretools.vscode-containers
code --install-extension ms-python.debugpy
code --install-extension ms-python.python
code --install-extension ms-python.vscode-pylance
code --install-extension ms-python.vscode-python-envs
code --install-extension ms-toolsai.jupyter
code --install-extension ms-toolsai.jupyter-keymap
code --install-extension ms-toolsai.jupyter-renderers
code --install-extension ms-toolsai.vscode-jupyter-cell-tags
code --install-extension ms-toolsai.vscode-jupyter-slideshow
code --install-extension ms-vscode-remote.vscode-remote-extensionpack
code --install-extension rust-lang.rust-analyzer
code --install-extension tintinweb.graphviz-interactive-preview
code --install-extension vadimcn.vscode-lldb
code --install-extension vscodevim.vim
code --install-extension webfreak.debug

# Trying out
# Cline: code --install-extension saoudrizwan.claude-dev
