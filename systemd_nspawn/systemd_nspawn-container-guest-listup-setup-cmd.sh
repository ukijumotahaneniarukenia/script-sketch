echo /var/lib/machines/.#vir-ubuntu-18-04-001 | xargs rm -rf
echo /var/lib/machines/.#vir-ubuntu-18-04-002 | xargs rm -rf
echo /var/lib/machines/.#vir-ubuntu-18-04-003 | xargs rm -rf
echo /var/lib/machines/.#vir-ubuntu-18-04-004 | xargs rm -rf
echo /var/lib/machines/.#vir-ubuntu-18-04-005 | xargs rm -rf
cd /var/lib/machines && machinectl terminate vir-ubuntu-18-04-001
cd /var/lib/machines && machinectl terminate vir-ubuntu-18-04-002
cd /var/lib/machines && machinectl terminate vir-ubuntu-18-04-003
cd /var/lib/machines && machinectl terminate vir-ubuntu-18-04-004
cd /var/lib/machines && machinectl terminate vir-ubuntu-18-04-005
rm -rf /var/lib/machines/vir-ubuntu-18-04-001
rm -rf /var/lib/machines/vir-ubuntu-18-04-002
rm -rf /var/lib/machines/vir-ubuntu-18-04-003
rm -rf /var/lib/machines/vir-ubuntu-18-04-004
rm -rf /var/lib/machines/vir-ubuntu-18-04-005
cp -a /var/lib/machines/vir-ubuntu-18-04-template /var/lib/machines/vir-ubuntu-18-04-001
cp -a /var/lib/machines/vir-ubuntu-18-04-template /var/lib/machines/vir-ubuntu-18-04-002
cp -a /var/lib/machines/vir-ubuntu-18-04-template /var/lib/machines/vir-ubuntu-18-04-003
cp -a /var/lib/machines/vir-ubuntu-18-04-template /var/lib/machines/vir-ubuntu-18-04-004
cp -a /var/lib/machines/vir-ubuntu-18-04-template /var/lib/machines/vir-ubuntu-18-04-005
cd /var/lib/machines && machinectl start vir-ubuntu-18-04-001
cd /var/lib/machines && machinectl start vir-ubuntu-18-04-002
cd /var/lib/machines && machinectl start vir-ubuntu-18-04-003
cd /var/lib/machines && machinectl start vir-ubuntu-18-04-004
cd /var/lib/machines && machinectl start vir-ubuntu-18-04-005
cd /var/lib/machines && machinectl shell root@vir-ubuntu-18-04-01 /bin/bash -c 'echo "root:root_pwd"|chpasswd';
cd /var/lib/machines && machinectl shell root@vir-ubuntu-18-04-02 /bin/bash -c 'echo "root:root_pwd"|chpasswd';
cd /var/lib/machines && machinectl shell root@vir-ubuntu-18-04-03 /bin/bash -c 'echo "root:root_pwd"|chpasswd';
cd /var/lib/machines && machinectl shell root@vir-ubuntu-18-04-04 /bin/bash -c 'echo "root:root_pwd"|chpasswd';
cd /var/lib/machines && machinectl shell root@vir-ubuntu-18-04-05 /bin/bash -c 'echo "root:root_pwd"|chpasswd';
cd /var/lib/machines && machinectl shell root@vir-ubuntu-18-04-001 /usr/bin/ln -sf /dev/null /etc/systemd/network/80-container-host0.network
cd /var/lib/machines && machinectl shell root@vir-ubuntu-18-04-002 /usr/bin/ln -sf /dev/null /etc/systemd/network/80-container-host0.network
cd /var/lib/machines && machinectl shell root@vir-ubuntu-18-04-003 /usr/bin/ln -sf /dev/null /etc/systemd/network/80-container-host0.network
cd /var/lib/machines && machinectl shell root@vir-ubuntu-18-04-004 /usr/bin/ln -sf /dev/null /etc/systemd/network/80-container-host0.network
cd /var/lib/machines && machinectl shell root@vir-ubuntu-18-04-005 /usr/bin/ln -sf /dev/null /etc/systemd/network/80-container-host0.network
cd /var/lib/machines && machinectl shell root@vir-ubuntu-18-04-01 /usr/bin/sed -i 's/#DNS/DNS=192.168.1.1/' /etc/systemd/resolved.conf
cd /var/lib/machines && machinectl shell root@vir-ubuntu-18-04-02 /usr/bin/sed -i 's/#DNS/DNS=192.168.1.1/' /etc/systemd/resolved.conf
cd /var/lib/machines && machinectl shell root@vir-ubuntu-18-04-03 /usr/bin/sed -i 's/#DNS/DNS=192.168.1.1/' /etc/systemd/resolved.conf
cd /var/lib/machines && machinectl shell root@vir-ubuntu-18-04-04 /usr/bin/sed -i 's/#DNS/DNS=192.168.1.1/' /etc/systemd/resolved.conf
cd /var/lib/machines && machinectl shell root@vir-ubuntu-18-04-05 /usr/bin/sed -i 's/#DNS/DNS=192.168.1.1/' /etc/systemd/resolved.conf
cp /var/lib/machines/80-container-host0.network-192.168.1.210 /var/lib/machines/vir-ubuntu-18-04-001/etc/systemd/network/80-container-host0.network
cp /var/lib/machines/80-container-host0.network-192.168.1.211 /var/lib/machines/vir-ubuntu-18-04-002/etc/systemd/network/80-container-host0.network
cp /var/lib/machines/80-container-host0.network-192.168.1.212 /var/lib/machines/vir-ubuntu-18-04-003/etc/systemd/network/80-container-host0.network
cp /var/lib/machines/80-container-host0.network-192.168.1.213 /var/lib/machines/vir-ubuntu-18-04-004/etc/systemd/network/80-container-host0.network
cp /var/lib/machines/80-container-host0.network-192.168.1.214 /var/lib/machines/vir-ubuntu-18-04-005/etc/systemd/network/80-container-host0.network
cp /var/lib/machines/host0.network-192.168.1.210 /var/lib/machines/vir-ubuntu-18-04-001/etc/systemd/network/host0.network
cp /var/lib/machines/host0.network-192.168.1.211 /var/lib/machines/vir-ubuntu-18-04-002/etc/systemd/network/host0.network
cp /var/lib/machines/host0.network-192.168.1.212 /var/lib/machines/vir-ubuntu-18-04-003/etc/systemd/network/host0.network
cp /var/lib/machines/host0.network-192.168.1.213 /var/lib/machines/vir-ubuntu-18-04-004/etc/systemd/network/host0.network
cp /var/lib/machines/host0.network-192.168.1.214 /var/lib/machines/vir-ubuntu-18-04-005/etc/systemd/network/host0.network
cd /var/lib/machines && machinectl shell root@vir-ubuntu-18-04-001 /bin/systemctl stop systemd-networkd
cd /var/lib/machines && machinectl shell root@vir-ubuntu-18-04-001 /bin/systemctl stop systemd-resolved
cd /var/lib/machines && machinectl shell root@vir-ubuntu-18-04-002 /bin/systemctl stop systemd-networkd
cd /var/lib/machines && machinectl shell root@vir-ubuntu-18-04-002 /bin/systemctl stop systemd-resolved
cd /var/lib/machines && machinectl shell root@vir-ubuntu-18-04-003 /bin/systemctl stop systemd-networkd
cd /var/lib/machines && machinectl shell root@vir-ubuntu-18-04-003 /bin/systemctl stop systemd-resolved
cd /var/lib/machines && machinectl shell root@vir-ubuntu-18-04-004 /bin/systemctl stop systemd-networkd
cd /var/lib/machines && machinectl shell root@vir-ubuntu-18-04-004 /bin/systemctl stop systemd-resolved
cd /var/lib/machines && machinectl shell root@vir-ubuntu-18-04-005 /bin/systemctl stop systemd-networkd
cd /var/lib/machines && machinectl shell root@vir-ubuntu-18-04-005 /bin/systemctl stop systemd-resolved
cd /var/lib/machines && machinectl shell root@vir-ubuntu-18-04-001 /bin/systemctl enable systemd-networkd
cd /var/lib/machines && machinectl shell root@vir-ubuntu-18-04-001 /bin/systemctl enable systemd-resolved
cd /var/lib/machines && machinectl shell root@vir-ubuntu-18-04-002 /bin/systemctl enable systemd-networkd
cd /var/lib/machines && machinectl shell root@vir-ubuntu-18-04-002 /bin/systemctl enable systemd-resolved
cd /var/lib/machines && machinectl shell root@vir-ubuntu-18-04-003 /bin/systemctl enable systemd-networkd
cd /var/lib/machines && machinectl shell root@vir-ubuntu-18-04-003 /bin/systemctl enable systemd-resolved
cd /var/lib/machines && machinectl shell root@vir-ubuntu-18-04-004 /bin/systemctl enable systemd-networkd
cd /var/lib/machines && machinectl shell root@vir-ubuntu-18-04-004 /bin/systemctl enable systemd-resolved
cd /var/lib/machines && machinectl shell root@vir-ubuntu-18-04-005 /bin/systemctl enable systemd-networkd
cd /var/lib/machines && machinectl shell root@vir-ubuntu-18-04-005 /bin/systemctl enable systemd-resolved
cd /var/lib/machines && machinectl shell root@vir-ubuntu-18-04-001 /bin/systemctl start systemd-networkd
cd /var/lib/machines && machinectl shell root@vir-ubuntu-18-04-001 /bin/systemctl start systemd-resolved
cd /var/lib/machines && machinectl shell root@vir-ubuntu-18-04-002 /bin/systemctl start systemd-networkd
cd /var/lib/machines && machinectl shell root@vir-ubuntu-18-04-002 /bin/systemctl start systemd-resolved
cd /var/lib/machines && machinectl shell root@vir-ubuntu-18-04-003 /bin/systemctl start systemd-networkd
cd /var/lib/machines && machinectl shell root@vir-ubuntu-18-04-003 /bin/systemctl start systemd-resolved
cd /var/lib/machines && machinectl shell root@vir-ubuntu-18-04-004 /bin/systemctl start systemd-networkd
cd /var/lib/machines && machinectl shell root@vir-ubuntu-18-04-004 /bin/systemctl start systemd-resolved
cd /var/lib/machines && machinectl shell root@vir-ubuntu-18-04-005 /bin/systemctl start systemd-networkd
cd /var/lib/machines && machinectl shell root@vir-ubuntu-18-04-005 /bin/systemctl start systemd-resolved
cd /var/lib/machines && machinectl shell root@vir-ubuntu-18-04-001 /bin/systemctl status systemd-networkd
cd /var/lib/machines && machinectl shell root@vir-ubuntu-18-04-001 /bin/systemctl status systemd-resolved
cd /var/lib/machines && machinectl shell root@vir-ubuntu-18-04-002 /bin/systemctl status systemd-networkd
cd /var/lib/machines && machinectl shell root@vir-ubuntu-18-04-002 /bin/systemctl status systemd-resolved
cd /var/lib/machines && machinectl shell root@vir-ubuntu-18-04-003 /bin/systemctl status systemd-networkd
cd /var/lib/machines && machinectl shell root@vir-ubuntu-18-04-003 /bin/systemctl status systemd-resolved
cd /var/lib/machines && machinectl shell root@vir-ubuntu-18-04-004 /bin/systemctl status systemd-networkd
cd /var/lib/machines && machinectl shell root@vir-ubuntu-18-04-004 /bin/systemctl status systemd-resolved
cd /var/lib/machines && machinectl shell root@vir-ubuntu-18-04-005 /bin/systemctl status systemd-networkd
cd /var/lib/machines && machinectl shell root@vir-ubuntu-18-04-005 /bin/systemctl status systemd-resolved
systemctl stop systemd-nspawn@vir-ubuntu-18-04-001.service
systemctl stop systemd-nspawn@vir-ubuntu-18-04-002.service
systemctl stop systemd-nspawn@vir-ubuntu-18-04-003.service
systemctl stop systemd-nspawn@vir-ubuntu-18-04-004.service
systemctl stop systemd-nspawn@vir-ubuntu-18-04-005.service
systemctl enable systemd-nspawn@vir-ubuntu-18-04-001.service
systemctl enable systemd-nspawn@vir-ubuntu-18-04-002.service
systemctl enable systemd-nspawn@vir-ubuntu-18-04-003.service
systemctl enable systemd-nspawn@vir-ubuntu-18-04-004.service
systemctl enable systemd-nspawn@vir-ubuntu-18-04-005.service
systemctl start systemd-nspawn@vir-ubuntu-18-04-001.service
systemctl start systemd-nspawn@vir-ubuntu-18-04-002.service
systemctl start systemd-nspawn@vir-ubuntu-18-04-003.service
systemctl start systemd-nspawn@vir-ubuntu-18-04-004.service
systemctl start systemd-nspawn@vir-ubuntu-18-04-005.service
systemctl status systemd-nspawn@vir-ubuntu-18-04-001.service
systemctl status systemd-nspawn@vir-ubuntu-18-04-002.service
systemctl status systemd-nspawn@vir-ubuntu-18-04-003.service
systemctl status systemd-nspawn@vir-ubuntu-18-04-004.service
systemctl status systemd-nspawn@vir-ubuntu-18-04-005.service
cp /home/aine/script-sketch/systemd_nspawn/systemd_nspawn-container-guest-listup-entry-cmd.sh /var/lib/machines/vir-ubuntu-18-04-001/etc/
cp /home/aine/script-sketch/systemd_nspawn/systemd_nspawn-container-guest-listup-entry-cmd.sh /var/lib/machines/vir-ubuntu-18-04-002/etc/
cp /home/aine/script-sketch/systemd_nspawn/systemd_nspawn-container-guest-listup-entry-cmd.sh /var/lib/machines/vir-ubuntu-18-04-003/etc/
cp /home/aine/script-sketch/systemd_nspawn/systemd_nspawn-container-guest-listup-entry-cmd.sh /var/lib/machines/vir-ubuntu-18-04-004/etc/
cp /home/aine/script-sketch/systemd_nspawn/systemd_nspawn-container-guest-listup-entry-cmd.sh /var/lib/machines/vir-ubuntu-18-04-005/etc/
