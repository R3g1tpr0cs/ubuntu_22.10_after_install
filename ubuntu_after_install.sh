#! /bin/bash

sudo apt update && sudo apt dist-upgrade -y

sudo mkdir -pm755 /etc/apt/keyrings
sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/kinetic/winehq-kinetic.sources

sudo add-apt-repository ppa:smartfinn/eve-ng-integration

sudo apt install curl -y
curl -fsS https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo gpg --dearmor -o /usr/share/keyrings/packages-pgadmin-org.gpg
sudo sh -c 'echo "deb [signed-by=/usr/share/keyrings/packages-pgadmin-org.gpg] https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list && apt update'

sudo apt-add-repository ppa:cubic-wizard/release
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 6494C6D6997C215E

sudo curl -o /usr/share/keyrings/syncthing-archive-keyring.gpg https://syncthing.net/release-key.gpg
echo "deb [signed-by=/usr/share/keyrings/syncthing-archive-keyring.gpg] https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list

sudo apt install -y wget gnupg lsb-release apt-transport-https ca-certificates
distro=$(if echo " una vanessa focal jammy bullseye vera uma" | grep -q " $(lsb_release -sc) "; then echo $(lsb_release -sc); else echo focal; fi)
wget -O- https://deb.librewolf.net/keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/librewolf.gpg
sudo tee /etc/apt/sources.list.d/librewolf.sources << EOF > /dev/null
Types: deb
URIs: https://deb.librewolf.net
Suites: $distro
Components: main
Architectures: amd64
Signed-By: /usr/share/keyrings/librewolf.gpg
EOF

sudo apt update
sudo apt dist-upgrade -y

sudo apt install --install-recommends winehq-stable
wine winecfg

sudo apt install libfuse2 flatpak aptitude gnome-tweaks gnome-shell-extension-manager ubuntu-restricted-extras nmap wireshark putty gdebi keepassxc chromium-browser vlc audacity gimp obs-studio zeal eve-ng-integration -y

sudo apt install winetricks syncthing librewolf cubic pgadmin4-desktop darktable -y
sudo apt install gnome-tweaks gnome-shell-extension-manager ubuntu-restricted-extras -y
sudo apt install nmap wireshark git putty gdebi -y
sudo apt install filezilla docker git mixxx -y
sudo apt install openjdk-17-jre-headless default-jre -y
sudo apt install keepassxc chromium-browser vlc audacity gimp minicom -y
sudo apt install obs-studio zeal eve-ng-integration steam-installer python3-pip python3-venv -y

sudo snap install discord telegram-desktop dbeaver-ce code --classic

sudo sh -c "echo 'deb https://http.kali.org/kali kali-rolling main non-free contrib' > /etc/apt/sources.list.d/kali.list" -y
sudo apt install gnupg -y
wget 'https://archive.kali.org/archive-key.asc'
sudo apt-key add archive-key.asc
sudo apt update
sudo sh -c "echo 'Package: *'>/etc/apt/preferences.d/kali.pref; echo 'Pin: release a=kali-rolling'>>/etc/apt/preferences.d/kali.pref; echo 'Pin-Priority: 50'>>/etc/apt/preferences.d/kali.pref" -y
sudo apt update
sudo aptitude install -t kali-rolling wpscan dirsearch gobuster airgeddon bettercap ettercap-graphical hostapd-wpe bully pixiewps dhcpd asleap hashcat hostapd tshark mdk4 hcxdumptool reaver john crunch beef lighttpd -y


