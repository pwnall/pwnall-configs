# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# git defaults to nano for editing commit messages.
export EDITOR=vim

# hyperterm doesn't set LANG.
export LANG="${LANG:-'en_US.UTF-8'}"

# Manually installed software.
if [ -d "$HOME/.local/bin" ]; then
  export PATH="$PATH:$HOME/.local/bin"
fi

# Homebrew on macOS arm64.
if [ -d /opt/homebrew/bin ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Homebrew on macOS x64.
if [ -d "$HOME/.homebrew" ]; then
  eval "$($HOME/.homebrew/bin/brew shellenv)"
fi

# Homebrew on Linux.
if [ -d /home/linuxbrew/.linuxbrew ]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi
if [ -d "$HOME/.linuxbrew" ]; then
  eval "$($HOME/.linuxbrew/bin/brew shellenv)"
fi

# Nix multi-user with daemon.
if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
  . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi

# Nix single-user without daemon.
if [ -e "$HOME/.nix-profile/etc/profile.d/nix.sh" ]; then
  . "$HOME/.nix-profile/etc/profile.d/nix.sh"
fi

# Rust via cargo.rs.
if [ -d "$HOME/.cargo" ]; then
  export PATH="$HOME/.cargo/bin:$PATH"
  . "$HOME/.cargo/env"
fi

# Lean via elan.
if [ -d "$HOME/.elan" ]; then
  export PATH="$HOME/.elan/bin:$PATH"
  . "$HOME/.elan/env"
fi

# nvm on both Linux and OSX.
if [ -d "$HOME/.nvm" ]; then
  . "$HOME/.nvm/nvm.sh"
  . "$HOME/.nvm/bash_completion"
fi

# nVidia CUDA.
if [ -d "$HOME/cuda/bin" ]; then
  export CUDA_HOME="$HOME/cuda"
  export PATH="$PATH:$HOME/cuda/bin"
fi

# Fuchsia build setup.
if [ -d $HOME/fuchsia ]; then
  export PATH="$HOME/fuchsia/.jiri_root/bin:$PATH"
  . "$HOME/fuchsia/scripts/fx-env.sh"
fi

# Pulumi
if [ -d "$HOME/.pulumi" ]; then
  export PATH="$PATH:/home/pwnall/.pulumi/bin"
fi

# rbenv on both Linux and OSX.
if [ -d "$HOME/.rbenv" ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi
