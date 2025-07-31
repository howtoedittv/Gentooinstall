env-update && source /etc/profile && export PS1="(chroot) $PS1" 
wget https://github.com/howtoedittv/Gentooinstall/releases/download/1.0/make.conf
chmod 777 make.conf
rm /etc/portage/make.conf
mv make.conf /etc/portage
emerge-webrsync
emerge --sync --quiet  
emerge --quiet --update --deep --changed-use @world 
ln -sf ../usr/share/zoneinfo/Asia/Jerusalem /etc/localtime
wget https://github.com/howtoedittv/Gentooinstall/releases/download/1.0/locale.gen.bak
mv locale.gen.bak locale.gen 
chmod 777 locale.gen
rm /etc/locale.gen
mv locale.gen /etc
locale-gen
eselect locale set 4
env-update && source /etc/profile && export PS1="(chroot) $PS1"
echo ">=sys-kernel/installkernel-50 dracut" >> /etc/portage/package.use/linux-firmware
emerge -q sys-kernel/linux-firmware
emerge -q sys-firmware/sof-firmware
echo "sys-kernel/installkernel dracut grub" >> /etc/portage/package.use/installkernel
emerge -q sys-kernel/installkernel
emerge -q sys-kernel/gentoo-kernel-bin
emerge -q sys-fs/genfstab
genfstab -U / >> /etc/fstab
wget https://github.com/howtoedittv/Gentooinstall/releases/download/1.0/hostname.bak
mv hostname.bak hostname
chmod 777 hostname
rm /etc/init.d/hostname
mv hostname /etc/init.d/
wget https://github.com/howtoedittv/Gentooinstall/releases/download/1.0/hosts.bak
mv hosts.bak hosts
chmod 777 hosts
rm /etc/hosts
mv hosts /etc/
emerge -q net-misc/dhcpcd
emerge -q --noreplace net-misc/netifrc
passwd 
echo "what is your wanted username? "
read user
useradd -m -G users,wheel,audio,video -s /bin/bash $user
passwd $user
emerge -q sudo
wget https://github.com/howtoedittv/Gentooinstall/releases/download/1.0/postinstall.sh
mv postinstall.sh /home/$user
echo "grub installion if gurb install in a correct way you will need to exit from chroot by typing 'exit' and reboot"
while true; do
        echo "mbr or efi"
        echo "1) efi  "
        echo "2) mbr "
        echo "q) exit "
        read -p "select one of the distros above: " CHOICE
        case "$CHOICE" in
	1) 
	echo 'GRUB_PLATFORMS="efi-64"' >> /etc/portage/make.conf
	emerge -q sys-boot/grub efibootmgr
	mkdir /boot/efi
	mount /dev/sda1 /boot/efi
	rm /etc/fstab
	genfstab -U >> /etc/fstab
	cat /etc/fstab 
	grub-install --efi-directory=/boot/efi 
	grub-mkconfig -o /boot/grub/grub.cfg
	;;
	2)
	grub-install --target=i386-pc /dev/sda
	grub-mkconfig -o /boot/grub/grub.cfg
	;;
	q)
	exit
	;;
	
	esac
done 



