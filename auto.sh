#!/bin/bash

#rclone mount --vfs-cache-mode writes --daemon  google_drive:Fast.io/aarch64.imfast.io/packages ../packages
git submodule update --rebase
git submodule foreach makepkg --clean --ignorearch --ignorearch --syncdeps
repo-add  --remove  ../packages/aarch64.db.tar.gz ../packages/*.pkg.tar.xz
rclone sync  ../packages/  google_drive:/Fast.io/aarch64.imfast.io/packages --progress
#fusermount -u  ../packages
