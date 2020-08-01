cp -a /var/lib/machines/vir-ubuntu-20-04-template /var/lib/machines/vir-ubuntu-20-04-02
cp -a /var/lib/machines/vir-ubuntu-20-04-template /var/lib/machines/vir-ubuntu-20-04-03
cp -a /var/lib/machines/vir-ubuntu-20-04-template /var/lib/machines/vir-ubuntu-20-04-04
cp -a /var/lib/machines/vir-ubuntu-20-04-template /var/lib/machines/vir-ubuntu-20-04-05
machinectl shell root@vir-ubuntu-20-04-02 /bin/bash -c 'echo "root:root_pwd"|chpasswd'
machinectl shell root@vir-ubuntu-20-04-03 /bin/bash -c 'echo "root:root_pwd"|chpasswd'
machinectl shell root@vir-ubuntu-20-04-04 /bin/bash -c 'echo "root:root_pwd"|chpasswd'
machinectl shell root@vir-ubuntu-20-04-05 /bin/bash -c 'echo "root:root_pwd"|chpasswd'
machinectl shell root@vir-ubuntu-20-04-02 /usr/bin/ln -sf /dev/null /etc/systemd/network/80-container-host0.network
machinectl shell root@vir-ubuntu-20-04-03 /usr/bin/ln -sf /dev/null /etc/systemd/network/80-container-host0.network
machinectl shell root@vir-ubuntu-20-04-04 /usr/bin/ln -sf /dev/null /etc/systemd/network/80-container-host0.network
machinectl shell root@vir-ubuntu-20-04-05 /usr/bin/ln -sf /dev/null /etc/systemd/network/80-container-host0.network
machinectl shell root@vir-ubuntu-20-04-02 /usr/bin/sed -i 's/#DNS/DNS=192.168.1.1/' /etc/systemd/resolved.conf
machinectl shell root@vir-ubuntu-20-04-03 /usr/bin/sed -i 's/#DNS/DNS=192.168.1.1/' /etc/systemd/resolved.conf
machinectl shell root@vir-ubuntu-20-04-04 /usr/bin/sed -i 's/#DNS/DNS=192.168.1.1/' /etc/systemd/resolved.conf
machinectl shell root@vir-ubuntu-20-04-05 /usr/bin/sed -i 's/#DNS/DNS=192.168.1.1/' /etc/systemd/resolved.conf
machinectl shell root@vir-ubuntu-20-04-02 /usr/bin/cp /var/lib/machines/80-container-host0.network-192.168.1.210 /etc/systemd/network/80-container-host0.network
machinectl shell root@vir-ubuntu-20-04-03 /usr/bin/cp /var/lib/machines/80-container-host0.network-192.168.1.211 /etc/systemd/network/80-container-host0.network
machinectl shell root@vir-ubuntu-20-04-04 /usr/bin/cp /var/lib/machines/80-container-host0.network-192.168.1.212 /etc/systemd/network/80-container-host0.network
machinectl shell root@vir-ubuntu-20-04-05 /usr/bin/cp /var/lib/machines/80-container-host0.network-192.168.1.213 /etc/systemd/network/80-container-host0.network
machinectl shell root@vir-ubuntu-20-04-02 /usr/bin/cp /var/lib/machines/host0.network-192.168.1.210 /etc/systemd/network/host0.network
machinectl shell root@vir-ubuntu-20-04-03 /usr/bin/cp /var/lib/machines/host0.network-192.168.1.211 /etc/systemd/network/host0.network
machinectl shell root@vir-ubuntu-20-04-04 /usr/bin/cp /var/lib/machines/host0.network-192.168.1.212 /etc/systemd/network/host0.network
machinectl shell root@vir-ubuntu-20-04-05 /usr/bin/cp /var/lib/machines/host0.network-192.168.1.213 /etc/systemd/network/host0.network
