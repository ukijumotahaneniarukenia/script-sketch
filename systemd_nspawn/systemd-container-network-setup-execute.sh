rm -rf /var/lib/machines/vir-ubuntu-20-04-02
rm -rf /var/lib/machines/vir-ubuntu-20-04-03
rm -rf /var/lib/machines/vir-ubuntu-20-04-04
rm -rf /var/lib/machines/vir-ubuntu-20-04-05
cp -a /var/lib/machines/vir-ubuntu-20-04-template /var/lib/machines/vir-ubuntu-20-04-02
cp -a /var/lib/machines/vir-ubuntu-20-04-template /var/lib/machines/vir-ubuntu-20-04-03
cp -a /var/lib/machines/vir-ubuntu-20-04-template /var/lib/machines/vir-ubuntu-20-04-04
cp -a /var/lib/machines/vir-ubuntu-20-04-template /var/lib/machines/vir-ubuntu-20-04-05
machinectl start vir-ubuntu-20-04-02
machinectl start vir-ubuntu-20-04-03
machinectl start vir-ubuntu-20-04-04
machinectl start vir-ubuntu-20-04-05
machinectl shell root@vir-ubuntu-20-04-02 /bin/bash -c 'echo "root:root_pwd"|chpasswd';
machinectl shell root@vir-ubuntu-20-04-03 /bin/bash -c 'echo "root:root_pwd"|chpasswd';
machinectl shell root@vir-ubuntu-20-04-04 /bin/bash -c 'echo "root:root_pwd"|chpasswd';
machinectl shell root@vir-ubuntu-20-04-05 /bin/bash -c 'echo "root:root_pwd"|chpasswd';
machinectl shell root@vir-ubuntu-20-04-02 /usr/bin/ln -sf /dev/null /etc/systemd/network/80-container-host0.network
machinectl shell root@vir-ubuntu-20-04-03 /usr/bin/ln -sf /dev/null /etc/systemd/network/80-container-host0.network
machinectl shell root@vir-ubuntu-20-04-04 /usr/bin/ln -sf /dev/null /etc/systemd/network/80-container-host0.network
machinectl shell root@vir-ubuntu-20-04-05 /usr/bin/ln -sf /dev/null /etc/systemd/network/80-container-host0.network
machinectl shell root@vir-ubuntu-20-04-02 /usr/bin/sed -i 's/#DNS/DNS=192.168.1.1/' /etc/systemd/resolved.conf
machinectl shell root@vir-ubuntu-20-04-03 /usr/bin/sed -i 's/#DNS/DNS=192.168.1.1/' /etc/systemd/resolved.conf
machinectl shell root@vir-ubuntu-20-04-04 /usr/bin/sed -i 's/#DNS/DNS=192.168.1.1/' /etc/systemd/resolved.conf
machinectl shell root@vir-ubuntu-20-04-05 /usr/bin/sed -i 's/#DNS/DNS=192.168.1.1/' /etc/systemd/resolved.conf
cp 80-container-host0.network-192.168.1.210 vir-ubuntu-20-04-02/etc/systemd/network/80-container-host0.network
cp 80-container-host0.network-192.168.1.211 vir-ubuntu-20-04-03/etc/systemd/network/80-container-host0.network
cp 80-container-host0.network-192.168.1.212 vir-ubuntu-20-04-04/etc/systemd/network/80-container-host0.network
cp 80-container-host0.network-192.168.1.213 vir-ubuntu-20-04-05/etc/systemd/network/80-container-host0.network
cp host0.network-192.168.1.210 vir-ubuntu-20-04-02/etc/systemd/network/host0.network
cp host0.network-192.168.1.211 vir-ubuntu-20-04-03/etc/systemd/network/host0.network
cp host0.network-192.168.1.212 vir-ubuntu-20-04-04/etc/systemd/network/host0.network
cp host0.network-192.168.1.213 vir-ubuntu-20-04-05/etc/systemd/network/host0.network
machinectl shell root@vir-ubuntu-20-04-02 /bin/systemctl enable systemd-networkd
machinectl shell root@vir-ubuntu-20-04-02 /bin/systemctl enable systemd-resolved
machinectl shell root@vir-ubuntu-20-04-03 /bin/systemctl enable systemd-networkd
machinectl shell root@vir-ubuntu-20-04-03 /bin/systemctl enable systemd-resolved
machinectl shell root@vir-ubuntu-20-04-04 /bin/systemctl enable systemd-networkd
machinectl shell root@vir-ubuntu-20-04-04 /bin/systemctl enable systemd-resolved
machinectl shell root@vir-ubuntu-20-04-05 /bin/systemctl enable systemd-networkd
machinectl shell root@vir-ubuntu-20-04-05 /bin/systemctl enable systemd-resolved
machinectl shell root@vir-ubuntu-20-04-02 /bin/systemctl start systemd-networkd
machinectl shell root@vir-ubuntu-20-04-02 /bin/systemctl start systemd-resolved
machinectl shell root@vir-ubuntu-20-04-03 /bin/systemctl start systemd-networkd
machinectl shell root@vir-ubuntu-20-04-03 /bin/systemctl start systemd-resolved
machinectl shell root@vir-ubuntu-20-04-04 /bin/systemctl start systemd-networkd
machinectl shell root@vir-ubuntu-20-04-04 /bin/systemctl start systemd-resolved
machinectl shell root@vir-ubuntu-20-04-05 /bin/systemctl start systemd-networkd
machinectl shell root@vir-ubuntu-20-04-05 /bin/systemctl start systemd-resolved
