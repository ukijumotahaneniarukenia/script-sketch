echo /var/lib/machines/.#vir-ubuntu-18-04-001 | xargs rm -rf
sleep 2.5
cd /var/lib/machines && machinectl terminate vir-ubuntu-18-04-001
sleep 2.5
rm -rf /var/lib/machines/vir-ubuntu-18-04-001
sleep 2.5
cp -a /var/lib/machines/vir-ubuntu-18-04-template /var/lib/machines/vir-ubuntu-18-04-001
sleep 2.5
cd /var/lib/machines && machinectl start vir-ubuntu-18-04-001
sleep 2.5
cd /var/lib/machines && machinectl shell root@vir-ubuntu-18-04-001 /usr/bin/ln -sf /dev/null /etc/systemd/network/80-container-host0.network
sleep 2.5
cp /var/lib/machines/80-container-host0.network-192.168.1.210 /var/lib/machines/vir-ubuntu-18-04-001/etc/systemd/network/80-container-host0.network
sleep 2.5
cp /var/lib/machines/host0.network-192.168.1.210 /var/lib/machines/vir-ubuntu-18-04-001/etc/systemd/network/host0.network
sleep 2.5
cd /var/lib/machines && machinectl shell root@vir-ubuntu-18-04-001 /bin/systemctl stop systemd-networkd
sleep 2.5
cd /var/lib/machines && machinectl shell root@vir-ubuntu-18-04-001 /bin/systemctl stop systemd-resolved
sleep 2.5
cd /var/lib/machines && machinectl shell root@vir-ubuntu-18-04-001 /bin/systemctl enable systemd-networkd
sleep 2.5
cd /var/lib/machines && machinectl shell root@vir-ubuntu-18-04-001 /bin/systemctl enable systemd-resolved
sleep 2.5
cd /var/lib/machines && machinectl shell root@vir-ubuntu-18-04-001 /bin/systemctl start systemd-networkd
sleep 2.5
cd /var/lib/machines && machinectl shell root@vir-ubuntu-18-04-001 /bin/systemctl start systemd-resolved
sleep 2.5
cd /var/lib/machines && machinectl shell root@vir-ubuntu-18-04-001 /bin/systemctl status systemd-networkd
sleep 2.5
cd /var/lib/machines && machinectl shell root@vir-ubuntu-18-04-001 /bin/systemctl status systemd-resolved
sleep 2.5
systemctl stop systemd-nspawn@vir-ubuntu-18-04-001.service
sleep 2.5
systemctl enable systemd-nspawn@vir-ubuntu-18-04-001.service
sleep 2.5
systemctl start systemd-nspawn@vir-ubuntu-18-04-001.service
sleep 2.5
systemctl status systemd-nspawn@vir-ubuntu-18-04-001.service
sleep 2.5
cp /home/aine/script-sketch/systemd_nspawn/systemd_nspawn-container-guest-listup-entry-cmd.sh /var/lib/machines/vir-ubuntu-18-04-001/etc/
sleep 2.5
