#!/bin/sh

# Development dependencies installation, stage 2.
# New session (logout + login) required after stage 2.
# All installation steps are idempotent.

set -e  # Exit on errors.
set -u  # Exit on undefined variables.

# Make sure all stage 1 paths are available.
. "$HOME/.bash_profile"

# direnv fallback, if it wasn't installed from OS repositories.
if ! command -v direnv >/dev/null 2>&1; then
  brew install direnv
fi

# devenv.sh
nix-env --install --attr devenv -f https://github.com/NixOS/nixpkgs/tarball/nixpkgs-unstable

# uv for Python
if [ ! -f "$HOME/.cargo/bin/uv" ]; then
  cargo install --locked uv
fi

# Node.js
nvm install --lts

# nVidia CUDA SDK
if [ "$(uname -s)" = "Linux" ]; then
  if [ ! -d "$HOME/cuda" ]; then
    curl --proto '=https' --tlsv1.3 --silent --show-error --fail \
       --output cuda_sdk.run \
       https://developer.download.nvidia.com/compute/cuda/12.9.1/local_installers/cuda_12.9.1_575.57.08_linux.run
    export CUDA_ROOT="$HOME/cuda"
    sh cuda_sdk.run --silent --defaultroot="$HOME/cuda" --toolkit \
        --toolkitpath="$HOME/cuda" --samples --samplespath="$HOME/cuda/samples"
    rm cuda_sdk.run
  fi
fi
