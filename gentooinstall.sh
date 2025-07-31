cd /mnt/gentoo/
wget -O thing.tar.xz https://distfiles.gentoo.org/releases/amd64/autobuilds/current-stage3-amd64-desktop-openrc/stage3-amd64-desktop-openrc-20250727T163903Z.tar.xz
tar -xpvf thing.tar.xz  --xattrs-include='*.*' --numeric-owner
cp --dereference /etc/resolv.conf /mnt/gentoo/etc
mount --types proc /proc /mnt/gentoo/proc
mount --rbind /sys /mnt/gentoo/sys
mount --make-rslave /mnt/gentoo/sys
mount --rbind /dev /mnt/gentoo/dev
mount --make-rslave /mnt/gentoo/dev
mount --bind /run /mnt/gentoo/run
mount --make-slave /mnt/gentoo/run
wget https://github.com/howtoedittv/Gentooinstall/releases/download/1.0/base-system-install.sh
mv base-system-install.sh /mnt/gentoo
chroot /mnt/gentoo/ /bin/bash
