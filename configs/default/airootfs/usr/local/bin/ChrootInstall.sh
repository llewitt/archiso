ln -sf /usr/share/zoneinfo/GB /etc/localtime
hwclock --systohc
sed -ie '/.en_GB./s/#//' /etc/locale.gen
locale-gen
echo LANG=en_GB.UTF-8 > /etc/locale.conf
echo KEYMAP=uk > /etc/vconsole.conf
echo arch > /etc/hostname
bash

sed -ie '/MODULES=()/s/()/(crypt,lvm2)' /etc/mkinitcpio.conf
mkinitcpio -P

grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB

echo GRUB_ENABLE_CRYPTODISK=y >> /etc/default/grub
sed -ie '/GRUB_PRELOAD_MODULES/s/\=\"/\="lvm /'
grub-mkconfig -o /boot/grub/grub.cfg

