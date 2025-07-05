# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
. ~/.bashrc
fi

# hyperterm doesn't set LANG.
export LANG="${LANG:-'en_US.UTF-8'}"

# Fedora path augmentation.
if [ -d $HOME/.local ]; then
  export PATH="$PATH:$HOME/.local/bin"
fi
if [ -d $HOME/bin ]; then
  export PATH="$PATH:$HOME/bin"
fi

# Homebrew on macOS x86_64, good idea on Linux.
# export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# Homebrew on macOS arm64.
if [ -d /opt/homebrew/bin ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Homebrew installed in home directory.
if [ -d $HOME/.homebrew ]; then
  eval "$($HOME/.homebrew/bin/brew shellenv)"
fi

# rbenv on both Linux and OSX.
if [ -d $HOME/.rbenv ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

# nvm on both Linux and OSX.
[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh
[[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion

# Fuchsia build setup.
if [ -d $HOME/fuchsia ]; then
  export PATH="$HOME/fuchsia/.jiri_root/bin:$PATH"
  source "$HOME/fuchsia/scripts/fx-env.sh"
fi

# Android Gradle.
if [ -d "$HOME/gradle" ]; then
  export PATH="$PATH:$HOME/gradle/bin"
fi

# nVidia CUDA.
if [ -d /usr/local/cuda/bin ]; then
  export PATH="$PATH:/usr/local/cuda/bin"
fi

# Go workspace.
if [ -d "$HOME/go_path" ]; then
  export GOPATH="$HOME/go_path"
  export PATH="$PATH:$HOME/go_path/bin"
fi

# Rust.
if [ -d "$HOME/.cargo" ]; then
  export PATH="$HOME/.cargo/bin:$PATH"
  source "$HOME/.cargo/env"
fi

# Pulumi
if [ -d "$HOME/.pulumi" ]; then
  export PATH="$PATH:/home/pwnall/.pulumi/bin"
fi
