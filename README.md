# Kilian

A systems-programming layer for [Void Linux](https://voidlinux.org).

Kilian is not an operating system. It's an opinion on top of one: Void
underneath, a curated toolchain on top, aimed at people who want to learn
Linux from the inside — compile things, trace syscalls, break programs on
purpose, and understand why.

Most "beginner-friendly" distros work by hiding the machine. Kilian goes the
other way: it hands you the tools to open it up, and gets out of your way.

## What you get

Run one script on a fresh Void install and you have a box ready to build and
dissect low-level software:

- **toolchain** — `base-devel`, `gcc`, `gdb`, `binutils`, `cmake`, `clang` + `clangd`
- **inspectors** — `strace`, `ltrace`, `valgrind`
- **dev** — `git`, `tmux`, `neovim`, `curl`
- **system** — `htop`, `man-pages`, `man-db`

No desktop. No bloat. Terminal, compiler, and the tools to see what your code
actually does when it runs.

## Install

On a fresh Void Linux install, as root, one line:

```sh
curl -fsSL https://deflated.xyz/kilian | sh
```

A fresh Void install is already root; if you're not, pipe into `sudo sh`.

Rather read before you run? (You should.) Clone and inspect first:

```sh
git clone https://github.com/ripkiiii/kilian
cd kilian && ./install.sh
```

## Why

Kilian came out of building things that needed Linux from the ground up — a
Redis clone in C, a container runtime, a compiler. Every time, the friction
wasn't the code. It was the environment. Kilian is the environment I wish I'd
had: opinionated, minimal, and honest about being a tool for learning.

Built under [Deflated](https://deflated.xyz).
