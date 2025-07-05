#!/bin/sh

# Development configuration tweaks.

set -e  # Exit on errors.
set -u  # Exit on undefined variables.

if [ "$(id -u)" -ne 0 ]; then
  echo "This script requires root privileges. Please re-run with 'sudo'."
  exit 1
fi

cat <<EOF > /etc/sysctl.d/99-user-inotify.conf
fs.inotify.max_user_instances=8192
fs.inotify.max_user_watches=4194304
EOF

if ! sysctl -p --system > /dev/null 2>&1; then
  echo "Failed to apply system configuration via sysctl."
  exit 1
fi

if [ "$(cat /proc/sys/fs/inotify/max_user_instances)" -ne "8192" ]; then
  echo "Setting max_user_instances failed"
  exit 1
fi

if [ "$(cat /proc/sys/fs/inotify/max_user_watches)" -ne "4194304" ]; then
  echo "Setting max_user_watches failed"
  exit 1
fi
