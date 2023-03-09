#!/bin/bash
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install snapd flatpak -y
git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git

sudo snap remove firefox
sudo add-apt-repository ppa:mozillateam/ppa
sudo apt-get update -y

echo '
Package: *
Pin: release o=LP-PPA-mozillateam
Pin-Priority: 1001
' | sudo tee /etc/apt/preferences.d/mozilla-firefox

echo 'Unattended-Upgrade::Allowed-Origins:: "LP-PPA-mozillateam:${distro_codename}";' | sudo tee /etc/apt/apt.conf.d/51unattended-upgrades-firefox

sudo apt-get install firefox plank tilix steam vlc neofetch neovim virtualbox
sudo snap install onlyoffice-ds simplenote spotify discord
sudo mkdir ~/.fonts/
sudo tar -xf ~/Downloads/deb-setup/fonts.tar.gz --directory ~/.fonts/
sudo cp -r ~/Downloads/deb-setup/wp ~/Pictures/
sudo mv ~/Downloads/deb-setup/wp /etc/
cd ~/Downloads/deb-setup/WhiteSur-gtk-theme/
./install.sh/
