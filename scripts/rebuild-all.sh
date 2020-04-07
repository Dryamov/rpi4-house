#!/bin/bash
git submodule update --rebase
git add .
git commit -m "Before build"
git push
#git submodule foreach makepkg --clean --ignorearch --ignorearch --syncdeps
cp ~/packages/*.pkg.tar.xz packages/
repo-add --remove --new  rpi4-house.db.tar.gz  packages/*.pkg.tar.xz
rclone sync   ./  google_drive:/Fast.io/rpi4-house.imfast.io --progress --copy-links  --exclude-from configs/exclude-sync.conf
