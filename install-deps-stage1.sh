#!/bin/sh

# Development dependencies installation, stage 1.
# New session (logout + login) required before proceeding to stage 2.
# All installation steps are idempotent.

set -e  # Exit on errors.
set -u  # Exit on undefined variables.

# OS packages for Debian / Ubuntu.
if command -v apt >/dev/null 2>&1; then
  sudo apt update

  # nix dependencies.
  sudo apt install -y curl xz-utils

  # Homebrew dependencies. Also generally good for building.
  sudo apt install -y build-essential curl file git procps

  # Git commit message editing.
  sudo apt install -y vim

  # direnv from OS repositories.
  sudo apt install -y direnv

  # Android AOSP dependencies
  sudo apt install -y bison flex fontconfig gnupg \
      libc6-dev-i386 libx11-dev lib32z1-dev libgl1-mesa-dev libxml2-utils \
      x11proto-core-dev xsltproc unzip zip zlib1g-dev
fi

# Homebrew for Linux.
if [ "$(uname -s)" = "Linux" ]; then
  if [ ! -d "/home/linuxbrew/.linuxbrew" ]; then
    # Graceful fallback on systems with readonly /home.
    sudo mkdir -p /home/linuxbrew/.linuxbrew >/dev/null 2>&1 | true

    if [ -d "/home/linuxbrew/.linuxbrew" ]; then
      sudo chown "$(id -u -n):$(id -g -n)" "/home/linuxbrew/.linuxbrew"
      sudo chmod 775 "/home/linuxbrew/.linuxbrew"
      git clone --depth=1 https://github.com/Homebrew/brew.git "/home/linuxbrew/.linuxbrew"
    else
      if [ ! -d "$HOME/.linuxbrew" ]; then
        # Graceful fallback on systems with readonly /home.
        mkdir -p "$HOME/.linuxbrew"
        git clone --depth=1 https://github.com/Homebrew/brew.git "$HOME/.linuxbrew"
      fi
    fi
  fi
fi

# Homebrew for macOS.
if [ "$(uname -s)" = "Darwin" ]; then
  if [ ! -d "/opt/homebrew/" ]; then
    sudo mkdir -p /opt/homebrew

    sudo chown "$(id -u -n):$(id -g -n)" /opt/homebrew
    sudo chmod 775 /opt/homebrew
    git clone --depth=1 https://github.com/Homebrew/brew.git /opt/homebrew
  fi
fi

# Nix.
if [ ! -d /nix ]; then
  # The packaged version of nix crashes on Ubuntu 25.10.
  # https://bugs.launchpad.net/ubuntu/+source/nix/+bug/2131164
  if command -v apt >/dev/null 2>&1; then
    sudo apt install -y nix-setup-systemd
    sudo adduser $USER nix-users
  else
    curl --location --proto '=https' --tlsv1.3 --silent --show-error --fail \
        https://nixos.org/nix/install | sh -s -- --daemon --no-modify-profile
  fi
fi

# Rust via rustup.rs.
if [ ! -d "$HOME/.cargo" ]; then
  curl --proto '=https' --tlsv1.3 --silent --show-error --fail \
      https://sh.rustup.rs | \
      sh -s -- --profile default --default-toolchain stable --no-modify-path -y
fi

# Lean via elan.
if [ ! -d "$HOME/.elan" ]; then
  curl --proto '=https' --tlsv1.3 --silent --show-error --fail \
      https://elan.lean-lang.org/elan-init.sh | \
      sh -s -- --default-toolchain stable -y
fi

# nvm for Node.js.
if [ ! -d "$HOME/.nvm" ]; then
  git clone https://github.com/nvm-sh/nvm.git "$HOME/.nvm"
fi
