#!/bin/bash
set -e

id liveuser &>/dev/null || useradd -m -G wheel,audio,video,storage liveuser
echo "liveuser:live" | chpasswd
echo "root:root" | chpasswd

sed -i 's/^# %wheel/%wheel/' /etc/sudoers

systemctl enable NetworkManager
systemctl enable lightdm

systemctl disable araf-firstboot.service
rm -f /usr/local/bin/araf-firstboot.sh
