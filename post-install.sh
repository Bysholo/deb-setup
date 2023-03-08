#!/bin/bash
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install snapd flatpak -y

sudo snap remove firefox -y
sudo add-apt-repository ppa:mozillateam/ppa
sudo apt-get update -y

echo '
Package: *
Pin: release o=LP-PPA-mozillateam
Pin-Priority: 1001
' | sudo tee /etc/apt/preferences.d/mozilla-firefox

echo 'Unattended-Upgrade::Allowed-Origins:: "LP-PPA-mozillateam:${distro_codename}";' | sudo tee /etc/apt/apt.conf.d/51unattended-upgrades-firefox

sudo apt-get install firefox plank tilix steam vlc neofetch neovim -y
sudo snap install onlyoffice-ds simplenote spotify -y
sudo flatpak install org.discordapp.Discord org.kryogenix.Pick -y
cd ~/Downloads/
sudo tar -xf fonts.tar.gz --directory ~/.fonts/
sudo tar -xf themes.tar.gz --directory ~/.themes/
sudo cp -r wp ~/Pictures/
sudo mv wp /etc/
