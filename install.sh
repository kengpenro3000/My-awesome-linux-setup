#!/bin/bash

install_main() {
    sudo pacman -Sy godot zed rnote obsidian libreoffice-fresh libreoffice-fresh-ru okular btop telegram-desktop transmission-gtk gnome steam prismlauncher super-productivity
    yay -S happ-desktop-bin zen-browser-bin
}

install_niri() {
    sudo pacman -Sy xwayland-satellite xdg-desktop-portal-gnome xdg-desktop-portal-gtk niri fuzzel waybar swaybg ghostty ttf-jetbrains-mono-nerd
    systemctl --user add-wants niri.service waybar.service
    echo "[Unit]
    PartOf=graphical-session.target
    After=graphical-session.target
    Requisite=graphical-session.target

    [Service]
    ExecStart=/usr/bin/swaybg -c 000000 -i "%h/dots-arch/wallpaper-arghora-formless.jpg" -m center
    #replace this path with path for yout background image
    Restart=on-failure" > ~/.config/systemd/user/swaybg.service
    systemctl --user daemon-reload
    systemctl --user add-wants niri.service swaybg.service
    mkdir ~/waybar
    echo "{"include":["~/dots-arch/dots/config"]}" > ~/waybar/config.jsonc
    echo "@import url("$HOME/dots-arch/dots/style.css");" > ~/waybar/stule.css
}

install_yay() {
    sudo pacman -S --needed git base-devel
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    cd
    sudo rm -rf ./yay
    echo "Yay installed"
}

setup_fingerprint() {
    sudo pacman -Sy libfprint fprintd
    fprintd-enroll $USER
    echo "Fingerprint setuped"
}


echo "Options description"
echo -e "1) Install yay\n2) Install main pkgs\n3) Install niri dots\n4) Setup fingerprint"
echo -e "Enter one option -> \"1\" or many -> \"1 2 3 4\":"
read -a arr
for i in ${arr[@]}; do
    if [[ "$i" == "1" ]]; then
        install_yay
    elif [[ "$i" == "2" ]]; then
        install_main
    elif [[ "$i" == "3" ]]; then
        install_niri
    elif [[ "$i" == "4" ]]; then
        setup_fingerprint
    fi
done


echo "Instalation finished!"
