dotfiles
========

# Introduction

This repository provides `dotfiles` that contain configuration information for
common programs in a GNU/Linux operating system.

The `dotfiles` are organized by program.  In some cases, they are further
organized by program version.

# Install the Repository

To install the repository under your home directory, execute the commands
below.

```bash
cd

git clone https://github.com/DavidKiesel/dotfiles
```

# Install Packages

Each package is a directory under `${HOME}/dotfiles`.  When you install a
package, symbolic links (and possibly directories) are created under your home
directory corresponding to the files (and possibly directories) under the
package directory.

Note that, if the `stow` command for a given package encounters a pre-existing
conflict, it will abort the entire operation for that package.  If this
happens, you could manually remove or move aside any pre-existing files that
conflict.

## Install All Packages

To install all packages, execute the command below.

```bash
cd "${HOME}/dotfiles"

./stow_all
```

## Install Only One Package

For example, let's say you only want to install the `bash` package.

To install only the `bash` package, execute the command below.

```bash
cd "${HOME}/dotfiles"

stow bash
```

# Uninstall Packages

## Uninstall All Packages

To uninstall all packages, execute the command below.

```bash
cd "${HOME}/dotfiles"

./unstow_all
```

## Uninstall a Package

For example, let's say you only want to uninstall the `bash` package.

To uninstall only the `bash` package, execute the command below.

```bash
cd "${HOME}/dotfiles"

stow -D bash
```

# Change Primary Package Version

Some packages may contain multiple versions that are under a `.stow-versions`
directory under the primary package directory.  In that case, the `stow`
command has already been used to select the files from one of the versions to
be made available in the primary package directory.

For example, let's say that `${HOME}/dotfiles/bash/.stow-versions` contains
directories `bash-4.0.0` and `bash-4.1.0`.  And that by default, the `stow`
command has been used to make the `bash-4.1.0` files available under directory
`${HOME}/dotfiles/bash`.  And that you have already installed the `bash`
package under your home directory.

To install the `bash-4.0.0` package under your home directory, execute the
commands below.

```bash
cd "${HOME}/dotfiles"

stow -D bash

cd bash/.stow-versions

stow -D bash-4.1.0

stow bash-4.0.0

cd "${HOME}/dotfiles"

stow bash
```

# References

## `dotfiles`

- [https://en.wikipedia.org/wiki/Hidden_file_and_hidden_directory](https://en.wikipedia.org/wiki/Hidden_file_and_hidden_directory)

- [https://wiki.archlinux.org/index.php/Dotfiles](https://wiki.archlinux.org/index.php/Dotfiles)

- [https://github.com/search?q=dotfiles](https://github.com/search?q=dotfiles)

## Stow

- [https://www.gnu.org/software/stow/manual/stow.html](https://www.gnu.org/software/stow/manual/stow.html)
