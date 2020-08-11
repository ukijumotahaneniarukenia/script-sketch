gitなどの開発環境整備

```
su root
cd /usr/local/src
apt install -y git
git clone https://github.com/ukijumotahaneniarukenia/script-repo.git

cd script-repo

bash ubuntu-20-04-install-dev-pkg.sh

bash ubuntu-20-04-install-tool-pkg.sh

bash ubuntu-20-04-install-network-pkg.sh

bash ubuntu-20-04-install-vim-system.sh

bash ubuntu-20-04-install-vim-user.sh

bash ubuntu-20-04-install-vim_plug.sh

bash ubuntu-20-04-config-dotfile.sh

bash ubuntu-20-04-config-env.sh

bash ubuntu-20-04-config-ld.sh

bash ubuntu-20-04-config-font-RictyDiminished.sh
```
