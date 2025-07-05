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

# nVidia CUDA SDK
if [ ! -d "$HOME/cuda" ]; then
  curl -o cuda_sdk.run https://developer.download.nvidia.com/compute/cuda/12.9.1/local_installers/cuda_12.9.1_575.57.08_linux.run
  export CUDA_ROOT="$HOME/cuda"
  sh cuda_sdk.run --silent --defaultroot="$HOME/cuda" --toolkit \
      --toolkitpath="$HOME/cuda" --samples --samplespath="$HOME/cuda/samples"
  rm cuda_sdk.run
fi

if [ -d "HOME/cuda/bin" ]; then
  export CUDA_HOME="$HOME/cuda"
  export PATH="$HOME/cuda/bin:$PATH"
fi
