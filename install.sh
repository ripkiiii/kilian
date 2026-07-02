#!/bin/sh
#
# Kilian — a systems-programming focused layer on top of Void Linux.
# Turns a fresh Void install into a box ready to build, break, and
# understand low-level software.
#
#   Usage (on a fresh Void install, as root):
#     ./install.sh
#
# Kilian is not an OS. It's an opinion: Void underneath, a curated
# toolchain on top, aimed at people who want to learn Linux from the
# inside — not hide from it.

set -eu

KILIAN_VERSION="0.1.0"

# --- packages -------------------------------------------------------------
# The toolbox. Grouped by what they're for, so the opinion is legible.

TOOLCHAIN="base-devel gcc gdb binutils cmake clang clang-tools-extra"  # compile + debug, C/C++, gcc + clang/clangd
INSPECT="strace ltrace valgrind"                  # look inside running programs
DEV="git tmux neovim curl"                        # daily driving
SYSTEM="htop man-pages man-db"                     # observe + read the manual

PACKAGES="$TOOLCHAIN $INSPECT $DEV $SYSTEM"

# --- helpers --------------------------------------------------------------

say() { printf '\033[1;32m::\033[0m %s\n' "$1"; }
die() { printf '\033[1;31m!!\033[0m %s\n' "$1" >&2; exit 1; }

# --- guards ---------------------------------------------------------------

if [ "$(id -u)" -ne 0 ]; then
  die "run as root."
fi

if [ ! -f /etc/os-release ] || ! grep -Eq '^ID="?void"?' /etc/os-release; then
  die "this is meant for Void Linux."
fi

# --- run ------------------------------------------------------------------

say "Kilian v$KILIAN_VERSION — systems dev layer for Void"

say "syncing repositories + updating base system"
xbps-install -Syu

say "installing toolchain:  $TOOLCHAIN"
say "installing inspectors: $INSPECT"
say "installing dev tools:  $DEV"
say "installing system:     $SYSTEM"
xbps-install -y $PACKAGES

say "done. Kilian is ready — compile, trace, break, understand."
