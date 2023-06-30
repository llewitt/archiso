pacstrap -K /mnt \
	base \
	linux-lts \
	linux-firmware \
	vim \
	tmux \
	git \
	dhcpcd \
	grub \
	efivar

genfstab -U /mnt >> /mnt/etc/fstab
cp -a /usr/local/bin/ChrootInstall.sh /mnt/local/bin/ChrootInstall.sh
arch-chroot /mnt bash /local/bin/ChrootInstall.sh

