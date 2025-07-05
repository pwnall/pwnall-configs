#!/bin/sh

# Rust via rustup.rs
if [ ! -d "$HOME/.cargo" ]; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | \
      sh -s -- --profile default --default-toolchain stable --no-modify-path -y
fi

# Make Rust available to the rest of the script.
if [ -d "$HOME/.cargo" ]; then
  export PATH="$HOME/.cargo/bin:$PATH"
  source "$HOME/.cargo/env"
fi

# uv for Python
if [ ! -f "$HOME/.cargo/bin/uv" ]; then
  cargo install --git https://github.com/astral-sh/uv uv
fi

# nvm for Node.js
if [ ! -d "$HOME/.nvm" ]; then
  git clone https://github.com/nvm-sh/nvm.git "$HOME/.nvm"
fi

# Make nvm available to the rest of the script.
if [ -d "$HOME/.nvm" ]; then
  source "$HOME/.nvm/nvm.sh"
  source "$HOME/.nvm/bash_completion"
fi

# Node.js
nvm install stable
